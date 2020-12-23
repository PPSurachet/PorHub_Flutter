import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:porhub_flutter/models/movie.dart';
import 'package:porhub_flutter/views/detail/detail_screen.dart';

class BuildMovieSearch extends StatelessWidget {
  const BuildMovieSearch({
    Key key,
    @required this.searchResult,
    this.firebaseUser,
  }) : super(key: key);

  final String searchResult;
  final User firebaseUser;

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: (searchResult == '')
          ? FirebaseFirestore.instance.collection("movies").snapshots()
          : FirebaseFirestore.instance
              .collection("movies")
              .where('searchKeyword', arrayContains: searchResult)
              .snapshots(),
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

  InkWell buildInkWell(BuildContext context, DocumentSnapshot data) {
    final record = Movie.fromSnapshot(data);
    return InkWell(
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 2, vertical: 2),
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
              child: (record.uid.indexOf(firebaseUser.uid) != -1)
                  ? Icon(Icons.star, size: 25, color: Colors.yellow)
                  : Container(),
            ),
          ],
        ),
      ),
      onTap: () => Navigator.push(
        context,
        MaterialPageRoute(
          builder: (BuildContext context) => DetailScreen(
            record: record,
            documentsID: data.id,
          ),
        ),
      ),
    );
  }
}
