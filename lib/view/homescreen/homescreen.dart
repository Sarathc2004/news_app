import 'package:flutter/material.dart';

import 'package:news_app_using_api/controller/newscontroller.dart';

import 'package:news_app_using_api/view/homescreen/widgets/homescreencard.dart';
import 'package:news_app_using_api/view/searchscreen/searchscreen.dart';
import 'package:provider/provider.dart';

class Homescreen extends StatefulWidget {
  const Homescreen({super.key});

  @override
  State<Homescreen> createState() => _HomescreenState();
}

class _HomescreenState extends State<Homescreen> {
  @override
  void initState() {
    fetchdata();

    super.initState();
  }

  Future<void> fetchdata() async {
    Provider.of<Newscontroller>(context, listen: false).getdata();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "News app",
                style: TextStyle(color: Colors.white),
              ),
              InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => searchscreen(),
                        ));
                  },
                  child: Icon(Icons.search))
            ],
          ),
          backgroundColor: Colors.black,
        ),
        body: Provider.of<Newscontroller>(context).isloading == true
            ? Center(
                child: CircularProgressIndicator(),
              )
            : SingleChildScrollView(
                child: Column(
                  children: List.generate(
                      Provider.of<Newscontroller>(context)
                          .newsmodelres
                          .articles!
                          .length,
                      (index) => Homescreencard(
                            title: Provider.of<Newscontroller>(context)
                                    .newsmodelres
                                    .articles?[index]
                                    .title ??
                                "",
                            description: Provider.of<Newscontroller>(context)
                                    .newsmodelres
                                    .articles?[index]
                                    .description ??
                                "",
                            image: Provider.of<Newscontroller>(context)
                                    .newsmodelres
                                    .articles?[index]
                                    .urlToImage ??
                                "",
                            author: Provider.of<Newscontroller>(context)
                                    .newsmodelres
                                    .articles?[index]
                                    .author ??
                                "",
                          )),
                ),
              ));
  }
}
