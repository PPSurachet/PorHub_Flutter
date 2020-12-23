import 'package:cloud_firestore/cloud_firestore.dart';
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
      body: StreamDetailMovie(
        documentsID: documentsID,
        firebaseUser: firebaseUser,
      ),
    );
  }
}

class StreamDetailMovie extends StatelessWidget {
  const StreamDetailMovie({Key key, this.documentsID, this.firebaseUser})
      : super(key: key);
  final String documentsID;
  final User firebaseUser;
  @override
  Widget build(BuildContext context) {
    CollectionReference movies =
        FirebaseFirestore.instance.collection("movies");
    return StreamBuilder<dynamic>(
      stream: movies.doc(documentsID).snapshots(),
      builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
        if (!snapshot.hasData) return LinearProgressIndicator();

        return buildMovie(context, snapshot.data);
      },
    );
  }

  Widget buildMovie(BuildContext context, DocumentSnapshot data) {
    final record = Movie.fromSnapshot(data);
    return ListView(
      children: [
        Column(
          children: [
            BuildImageMovie(record: record),
            DetailMovie(
              firebaseUser: firebaseUser,
              record: record,
              documentsID: documentsID,
            ),
          ],
        )
      ],
    );
  }
}
