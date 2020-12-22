import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:porhub_flutter/models/movie.dart';
import 'package:porhub_flutter/views/detail/detail_screen.dart';

class BuildImage extends StatelessWidget {
  const BuildImage({
    Key key,
    @required this.context,
    @required this.data,
  }) : super(key: key);

  final BuildContext context;
  final DocumentSnapshot data;

  @override
  Widget build(BuildContext context) {
    final record = Movie.fromSnapshot(data);
    return InkWell(
      onTap: () => Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => DetailScreen(
            record: record,
            documentsID: data.id,
          ),
        ),
      ),
      child: Padding(
        padding: EdgeInsets.only(right: 10),
        child: Image.network(record.posterURL),
      ),
    );
  }
}
