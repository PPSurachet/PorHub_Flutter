import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:porhub_flutter/models/movie.dart';
import 'package:porhub_flutter/views/detail/detail_screen.dart';
import 'package:provider/provider.dart';

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
    final firebaseUser = context.watch<User>();
    final record = Movie.fromSnapshot(data);
    return InkWell(
      child: Stack(
        children: [
          Padding(
            padding: EdgeInsets.only(right: 10),
            child: Image.network(record.posterURL),
          ),
          Positioned(
            right: 10,
            child: (record.uid.indexOf(firebaseUser.uid) != -1)
                ? Icon(
                    Icons.star,
                    size: 25,
                    color: Colors.yellow,
                  )
                : Container(),
          ),
        ],
      ),
      onTap: () => Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => DetailScreen(
            record: record,
            documentsID: data.id,
          ),
        ),
      ),
    );
  }
}
