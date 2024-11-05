import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:news_app/models/nasional_news_model.dart';

class NasionalNewsProvider with ChangeNotifier {
  List<NewsNasionalModel> _nasionalList = [];
  bool _isLoading = false;

  List<NewsNasionalModel> get nasionalList => _nasionalList;
  bool get isLoading => _isLoading;

  Future<void> fetchNewsUpdate() async {
    _isLoading = true;
    notifyListeners();

    final url =
        Uri.parse('https://api-berita-indonesia.vercel.app/cnn/nasional/');
    try {
      final response = await http.get(url);
      if (response.statusCode == 200) {
        final data = jsonDecode(response.body)['data'];
        _nasionalList = [
          NewsNasionalModel.fromJson(data)
        ]; // Menggunakan data dari API
      }
    } catch (error) {
      rethrow;
    }

    _isLoading = false;
    notifyListeners();
  }
}
