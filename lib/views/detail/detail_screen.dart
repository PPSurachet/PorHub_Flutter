import 'package:flutter/material.dart';
import 'package:porhub_flutter/models/movie.dart';
import 'package:porhub_flutter/views/detail/components/body.dart';

class DetailScreen extends StatelessWidget {
  final Movie record;

  const DetailScreen({Key key, this.record}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Body(record: record),
    );
  }
}
