import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:news_app_using_api/model/newsmodel.dart';
import 'package:http/http.dart' as http;

class Seachscreencontroller with ChangeNotifier {
  bool isloading = false;
  Newsmodel searchmodelres = Newsmodel();
  Map<String, dynamic> decodeddata = {};
  Future searchdata({required String search}) async {
    isloading = true;
    notifyListeners();
    final url = Uri.parse(
        "https://newsapi.org/v2/everything?q=$search&from=2023-12-12&to=2023-12-12&sortBy=popularity&apiKey=79c0322fcdf14f1eb2ef619f45e7de4f");
    final response = await http.get(url);
    print(response.body);
    print(response.statusCode);
    if (response.statusCode == 200) {
      decodeddata = jsonDecode(response.body);
      searchmodelres = Newsmodel.fromJson(decodeddata);
      print(
        searchmodelres.articles?[0].title ?? "",
      );
    } else {
      print("Api failed");
    }
    isloading = false;
    notifyListeners();
  }
}
