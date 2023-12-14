import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:news_app_using_api/model/newsmodel.dart';

class Newscontroller with ChangeNotifier {
  bool isloading = false;
  Newsmodel newsmodelres = Newsmodel();
  Map<String, dynamic> decodeddata = {};
  Future getdata() async {
    isloading = true;
    notifyListeners();
    final url = Uri.parse(
        "https://newsapi.org/v2/everything?q=apple&from=2023-12-12&to=2023-12-12&sortBy=popularity&apiKey=79c0322fcdf14f1eb2ef619f45e7de4f");
    final response = await http.get(url);
    print(response.body);
    print(response.statusCode);
    if (response.statusCode == 200) {
      decodeddata = jsonDecode(response.body);
      newsmodelres = Newsmodel.fromJson(decodeddata);
      print(
        newsmodelres.articles?[0].title ?? "",
      );
    } else {
      print("Api failed");
    }
    isloading = false;
    notifyListeners();
  }
}
