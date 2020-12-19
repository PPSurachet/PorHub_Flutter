import 'package:flutter/material.dart';
import 'package:porhub_flutter/models/movie.dart';
import 'package:porhub_flutter/views/detail/components/detailmovie.dart';
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
