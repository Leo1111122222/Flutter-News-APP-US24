import 'dart:convert';
import 'package:US24/Model/new_m.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class NewController extends GetxController {
  final newsList = <Article>[].obs;

  @override
  void onInit() {
    super.onInit();
    getData();
  }

  void getData() async {
    final url = Uri.parse(
        'https://newsapi.org/v2/top-headlines?country=us&apiKey=c75fb9ba1af24baea5f7f6440851a0af');
    try {
      final response = await http.get(url);
      if (response.statusCode == 200) {
        final jsonData = jsonDecode(response.body);
        final List<dynamic> articles = jsonData['articles'];
        newsList
            .assignAll(articles.map((json) => Article.fromJson(json)).toList());
      } else {
        throw Exception('Failed to load data');
      }
    } catch (e) {
      print('Error: $e');
    }
  }
}
