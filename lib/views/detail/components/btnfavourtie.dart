import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:porhub_flutter/models/movie.dart';

class BuildFavourBtn extends StatelessWidget {
  const BuildFavourBtn({
    Key key,
    this.record,
    this.firebaseUser,
    this.documentsID,
  }) : super(key: key);

  final Movie record;
  final User firebaseUser;
  final String documentsID;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.95,
      height: MediaQuery.of(context).size.height * 0.06,
      child: RaisedButton(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        color: Colors.red[900],
        child: Text(
          "Add Favourite",
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
        onPressed: () {
          FirebaseFirestore.instance
              .collection("movies")
              .doc(documentsID)
              .update({
            "uid": FieldValue.arrayUnion([firebaseUser.uid])
          });
        },
      ),
    );
  }
}

class TestEiei extends StatelessWidget {
  const TestEiei({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
