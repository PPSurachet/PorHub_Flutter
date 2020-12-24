import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:porhub_flutter/views/home/components/buildImage.dart';

class RecommendMovie extends StatelessWidget {
  const RecommendMovie({
    Key key,
  }) : super(key: key);

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
                  Icon(Icons.dashboard, color: Colors.white),
                  SizedBox(width: 5),
                  Text(
                    "Recommend",
                    style: TextStyle(
                      fontSize: 25,
                      color: Colors.white,
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
              child: BuildListRecommend(),
            ),
          ],
        ),
      ],
    );
  }
}

class BuildListRecommend extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    CollectionReference movies =
        FirebaseFirestore.instance.collection("movies");

    return StreamBuilder(
      stream: movies.where("rating", isGreaterThanOrEqualTo: 9).snapshots(),
      builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
        if (!snapshot.hasData) return CircularProgressIndicator();

        return _buildList(context, snapshot.data.documents);
      },
    );
  }

  Widget _buildList(BuildContext context, List<DocumentSnapshot> snapshot) {
    return ListView(
      padding: EdgeInsets.only(top: 5),
      scrollDirection: Axis.horizontal,
      children: snapshot
          .map((data) => BuildImage(context: context, data: data))
          .toList(),
    );
  }
}
