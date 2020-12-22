import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:porhub_flutter/models/movie.dart';
import 'package:porhub_flutter/views/detail/components/detailmovie.dart';
import 'package:porhub_flutter/views/detail/components/image.dart';
import 'package:provider/provider.dart';

class DetailScreen extends StatelessWidget {
  final Movie record;
  final String documentsID;
  const DetailScreen({Key key, this.record, this.documentsID})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final firebaseUser = context.watch<User>();
    return Scaffold(
      body: ListView(
        children: <Widget>[
          Column(
            children: [
              BuildPosterMovie(record: record),
              DetailMovie(
                record: record,
                firebaseUser: firebaseUser,
                documentsID: documentsID,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
