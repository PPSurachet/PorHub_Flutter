import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:porhub_flutter/views/home/components/buildImage.dart';

class HorrorMovie extends StatelessWidget {
  const HorrorMovie({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              margin: EdgeInsets.only(top: 10, left: 10),
              child: Row(
                children: [
                  Icon(Icons.cake),
                  SizedBox(width: 5),
                  Text(
                    "Horror",
                    style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.w500,
                    ),
                  )
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.only(left: 10),
              height: MediaQuery.of(context).size.height * 0.25,
              width: MediaQuery.of(context).size.width * 1,
              child: BuildListHorror(),
            ),
          ],
        ),
      ],
    );
  }
}

class BuildListHorror extends StatelessWidget {
  const BuildListHorror({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    CollectionReference movies = Firestore.instance.collection("movies");

    return StreamBuilder(
      stream: movies.where("category", arrayContains: "Horror").snapshots(),
      builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
        if (!snapshot.hasData) return LinearProgressIndicator();

        return buildList(context, snapshot.data.documents);
      },
    );
  }

  Widget buildList(BuildContext context, List<DocumentSnapshot> snapshot) {
    return ListView(
      padding: EdgeInsets.only(top: 5),
      scrollDirection: Axis.horizontal,
      children: snapshot
          .map((data) => BuildImage(context: context, data: data))
          .toList(),
    );
  }
}
