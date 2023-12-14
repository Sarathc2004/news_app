import 'package:flutter/material.dart';

class Homescreencard extends StatelessWidget {
  Homescreencard({
    super.key,
    required this.title,
    required this.description,
    required this.image,
    required this.author,
  });
  String title;
  String description;
  String image;
  String author;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration:
          BoxDecoration(border: Border.all(color: Colors.white, width: 1)),
      child: Column(
        children: [
          Container(
            height: 400,
            width: double.infinity,
            decoration: BoxDecoration(
              image: DecorationImage(
                  image: NetworkImage(image), fit: BoxFit.cover),
            ),
          ),
          ListTile(
            title: Text(
              title.trim(),
              style: TextStyle(color: Colors.white, fontSize: 20),
            ),
            subtitle: Text(description, style: TextStyle(color: Colors.white)),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  author,
                  style: TextStyle(color: Color.fromARGB(255, 150, 146, 146)),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
