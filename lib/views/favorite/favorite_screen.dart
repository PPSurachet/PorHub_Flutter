import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:porhub_flutter/models/movie.dart';
import 'package:porhub_flutter/views/detail/detail_screen.dart';
import 'package:provider/provider.dart';

class FavoriteScreen extends StatelessWidget {
  const FavoriteScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final firebaseUser = context.watch<User>();
    return ListView(
      children: <Widget>[
        Container(
          padding: EdgeInsets.symmetric(vertical: 10),
          height: MediaQuery.of(context).size.height * 0.83,
          child: Column(
            children: <Widget>[
              FavoriteMovie(firebaseUser: firebaseUser),
            ],
          ),
        )
      ],
    );
  }
}

class FavoriteMovie extends StatelessWidget {
  const FavoriteMovie({Key key, this.firebaseUser}) : super(key: key);
  final User firebaseUser;
  @override
  Widget build(BuildContext context) {
    CollectionReference movies =
        FirebaseFirestore.instance.collection("movies");

    return StreamBuilder<dynamic>(
      stream: movies.where('uid', arrayContains: firebaseUser.uid).snapshots(),
      builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
        if (!snapshot.hasData) return CircularProgressIndicator();

        return buildList(context, snapshot.data.documents);
      },
    );
  }

  Widget buildList(BuildContext context, List<DocumentSnapshot> snapshot) {
    return Expanded(
      child: GridView.count(
        childAspectRatio: (15 / 20),
        scrollDirection: Axis.vertical,
        crossAxisCount: 3,
        padding: EdgeInsets.symmetric(horizontal: 2),
        children: snapshot.map((data) => buildInkWell(context, data)).toList(),
      ),
    );
  }

  Container buildInkWell(BuildContext context, DocumentSnapshot data) {
    final record = Movie.fromSnapshot(data);
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 2, vertical: 2),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: Image.network(
          record.posterURL,
          fit: BoxFit.fill,
        ),
      ),
    );
  }
}
