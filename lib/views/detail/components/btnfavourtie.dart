import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:porhub_flutter/models/movie.dart';

class BuildFavourBtn extends StatefulWidget {
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
  _BuildFavourBtnState createState() => _BuildFavourBtnState();
}

class _BuildFavourBtnState extends State<BuildFavourBtn> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.95,
      height: MediaQuery.of(context).size.height * 0.06,
      child: buildRaisedButtonAdd(),
    );
  }

  RaisedButton buildRaisedButtonAdd() {
    bool favoriteMovie =
        (widget.record.uid.indexOf(widget.firebaseUser.uid) == -1);
    return RaisedButton(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      color: Colors.red[900],
      child: Text(
        favoriteMovie ? "Add Favorite" : "Remove Favorite",
        style: TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,
          fontSize: 20,
        ),
      ),
      onPressed: () {
        setState(() {
          if (favoriteMovie == true) {
            FirebaseFirestore.instance
                .collection("movies")
                .doc(widget.documentsID)
                .update({
              "uid": FieldValue.arrayUnion([widget.firebaseUser.uid])
            });
          } else {
            FirebaseFirestore.instance
                .collection("movies")
                .doc(widget.documentsID)
                .update({
              "uid": FieldValue.arrayRemove([widget.firebaseUser.uid])
            });
          }
        });
      },
    );
  }
}
