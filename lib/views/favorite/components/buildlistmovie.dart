import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:porhub_flutter/models/movie.dart';
import 'package:porhub_flutter/views/detail/detail_screen.dart';

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
      child: InkWell(
        child: Stack(
          children: <Widget>[
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.network(
                record.posterURL,
                fit: BoxFit.fill,
              ),
            ),
            Positioned(
              top: 5,
              right: 5,
              child: Icon(
                Icons.star,
                size: 25,
                color: Colors.yellow,
              ),
            ),
          ],
        ),
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (BuildContext context) => DetailScreen(
                record: record,
                documentsID: data.id,
              ),
            ),
          );
        },
      ),
    );
  }
}
