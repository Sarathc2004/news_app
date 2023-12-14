import 'package:flutter/material.dart';
import 'package:news_app_using_api/controller/newscontroller.dart';
import 'package:news_app_using_api/controller/searchscreencontroller.dart';
import 'package:news_app_using_api/view/homescreen/homescreen.dart';
import 'package:provider/provider.dart';

void main(List<String> args) {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider(
            create: (context) => Newscontroller(),
          ),
          ChangeNotifierProvider(
            create: (context) => Seachscreencontroller(),
          )
        ],
        child:
            MaterialApp(debugShowCheckedModeBanner: false, home: Homescreen()));
  }
}
