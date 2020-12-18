import 'package:flutter/material.dart';
import 'package:porhub_flutter/models/movie.dart';
import 'package:porhub_flutter/views/detail/components/btnfavourtie.dart';
import 'package:porhub_flutter/views/detail/components/category.dart';
import 'package:porhub_flutter/views/detail/components/image.dart';

class Body extends StatelessWidget {
  final Movie record;
  const Body({Key key, this.record}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        Column(
          children: [
            BuildPosterMovie(record: record),
            DetailMovie(record: record),
          ],
        ),
      ],
    );
  }
}

class DetailMovie extends StatelessWidget {
  final Movie record;
  const DetailMovie({Key key, this.record}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      color: Colors.black,
      child: Column(
        children: [
          Category(record: record),
          SizedBox(height: 15),
          BuildFavourBtn(record: record),
        ],
      ),
    );
  }
}
