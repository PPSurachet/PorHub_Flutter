import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:porhub_flutter/models/movie.dart';
import 'package:porhub_flutter/views/detail/detail_screen.dart';

class BuildlistSearch extends StatelessWidget {
  const BuildlistSearch({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    CollectionReference movies = Firestore.instance.collection("movies");

    return StreamBuilder(
      stream: movies.snapshots(),
      builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
        if (!snapshot.hasData) return LinearProgressIndicator();

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
        children: snapshot
            .map((data) => BuildImageListMovie(context: context, data: data))
            .toList(),
      ),
    );
  }
}

class BuildImageListMovie extends StatelessWidget {
  final BuildContext context;
  final DocumentSnapshot data;
  const BuildImageListMovie({Key key, this.context, this.data})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final record = Movie.fromSnapshot(data);
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (BuildContext context) => DetailScreen(
              record: record,
            ),
          ),
        );
      },
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 2, vertical: 2),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: Image.network(
            record.posterURL,
            fit: BoxFit.fill,
          ),
        ),
      ),
    );
  }
}
