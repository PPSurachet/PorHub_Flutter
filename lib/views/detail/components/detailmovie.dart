import 'package:flutter/material.dart';
import 'package:porhub_flutter/models/movie.dart';
import 'package:porhub_flutter/views/detail/components/btnfavourtie.dart';
import 'package:porhub_flutter/views/detail/components/btnplay.dart';
import 'package:porhub_flutter/views/detail/components/btntrailer.dart';
import 'package:porhub_flutter/views/detail/components/category.dart';

class DetailMovie extends StatelessWidget {
  final Movie record;
  const DetailMovie({Key key, this.record}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 5, vertical: 10),
      color: Colors.black,
      child: Column(
        children: [
          Category(record: record),
          SizedBox(height: 15),
          BuildFavourBtn(record: record),
          SizedBox(height: 15),
          BuildTrailerBtn(record: record),
          SizedBox(height: 15),
          BuildPlayBtn(record: record),
          SizedBox(height: 15),
          Text(
            record.title,
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 25,
            ),
            textAlign: TextAlign.center,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              record.review,
              style: TextStyle(
                color: Colors.white,
                fontSize: 15,
              ),
              textAlign: TextAlign.left,
            ),
          ),
        ],
      ),
    );
  }
}
