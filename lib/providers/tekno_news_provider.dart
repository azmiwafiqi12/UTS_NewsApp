import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:news_app/models/tekno_news_model.dart';

class TeknoNewsProvider with ChangeNotifier {
  List<NewsTeknoModel> _teknoList = [];
  bool _isLoading = false;

  List<NewsTeknoModel> get teknoList => _teknoList;
  bool get isLoading => _isLoading;

  Future<void> fetchTeknoNews() async {
    _isLoading = true;
    notifyListeners();

    final url =
        Uri.parse('https://api-berita-indonesia.vercel.app/antara/tekno/');
    try {
      final response = await http.get(url);
      if (response.statusCode == 200) {
        final data = jsonDecode(response.body)['data'];
        _teknoList = [NewsTeknoModel.fromJson(data)];
      }
    } catch (error) {
      rethrow;
    }

    _isLoading = false;
    notifyListeners();
  }
}
