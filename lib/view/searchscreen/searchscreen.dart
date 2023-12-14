import 'package:flutter/material.dart';

import 'package:news_app_using_api/controller/searchscreencontroller.dart';
import 'package:news_app_using_api/view/homescreen/widgets/homescreencard.dart';
import 'package:provider/provider.dart';

class searchscreen extends StatefulWidget {
  const searchscreen({super.key});

  @override
  State<searchscreen> createState() => _searchscreenState();
}

class _searchscreenState extends State<searchscreen> {
  TextEditingController searchcontroller = TextEditingController();
  @override
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              width: 390,
              height: 70,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.white,
                  ),
                  child: TextFormField(
                    controller: searchcontroller,
                    decoration: InputDecoration(
                      fillColor: Colors.white,
                      hintText: "Search",
                      border: OutlineInputBorder(
                        borderSide: BorderSide(),
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            ElevatedButton(
                onPressed: () {
                  Provider.of<Seachscreencontroller>(context, listen: false)
                      .searchdata(search: searchcontroller.text.toLowerCase());
                  searchcontroller.clear();
                },
                child: Text("Search")),
            ListView.builder(
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: Provider.of<Seachscreencontroller>(context)
                      .searchmodelres
                      .articles
                      ?.length ??
                  0,
              itemBuilder: (context, index) => Homescreencard(
                title: Provider.of<Seachscreencontroller>(context)
                        .searchmodelres
                        .articles?[index]
                        .title ??
                    "",
                description: Provider.of<Seachscreencontroller>(context)
                        .searchmodelres
                        .articles?[index]
                        .description ??
                    "",
                image: Provider.of<Seachscreencontroller>(context)
                        .searchmodelres
                        .articles?[index]
                        .urlToImage ??
                    "",
                author: Provider.of<Seachscreencontroller>(context)
                        .searchmodelres
                        .articles?[index]
                        .author ??
                    "",
              ),
            )
          ],
        ),
      ),
    );
  }
}
