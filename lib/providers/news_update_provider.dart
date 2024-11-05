import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:news_app/models/news_update_model.dart';

class NewsUpdateProvider with ChangeNotifier {
  List<NewsUpdateModel> _beritaList = [];
  bool _isLoading = false;

  List<NewsUpdateModel> get beritaList => _beritaList;
  bool get isLoading => _isLoading;

  Future<void> fetchNewsUpdate() async {
    _isLoading = true;
    notifyListeners();

    final url =
        Uri.parse('https://api-berita-indonesia.vercel.app/cnn/terbaru/');
    try {
      final response = await http.get(url);
      if (response.statusCode == 200) {
        final data = jsonDecode(response.body)['data'];
        _beritaList = [
          NewsUpdateModel.fromJson(data)
        ]; // Menggunakan data dari API
      }
    } catch (error) {
      rethrow;
    }

    _isLoading = false;
    notifyListeners();
  }
}
