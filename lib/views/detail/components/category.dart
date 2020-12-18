import 'package:flutter/material.dart';
import 'package:porhub_flutter/models/movie.dart';

class Category extends StatelessWidget {
  final Movie record;
  const Category({Key key, this.record}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: record.category.length,
        itemBuilder: (context, index) => buildCategories(index),
      ),
    );
  }

  Container buildCategories(int index) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 5),
      decoration: BoxDecoration(
        color: Colors.blue.shade800,
        borderRadius: BorderRadius.circular(360),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text(
          record.category[index],
          style: TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.bold,
            letterSpacing: 2,
          ),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
