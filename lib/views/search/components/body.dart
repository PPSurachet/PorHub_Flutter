import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:porhub_flutter/models/movie.dart';
import 'package:porhub_flutter/views/detail/detail_screen.dart';
import 'package:porhub_flutter/views/search/components/listmovie.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        BuildSearchBar(),
      ],
    );
  }
}

class BuildSearchBar extends StatelessWidget {
  const BuildSearchBar({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: IconButton(
        icon: Icon(
          Icons.menu,
          color: Colors.white,
          size: 25,
        ),
        onPressed: () {},
      ),
      title: TextField(
        style: TextStyle(color: Colors.white),
        decoration: InputDecoration(
          hintText: "Search",
          hintStyle: TextStyle(color: Colors.white.withOpacity(0.6)),
          suffixIcon: Icon(
            Icons.search,
            color: Colors.white,
          ),
        ),
        onSubmitted: (text) {
          movies.clear();
          getMovieSearch(text);
        },
      ),
    );
  }
}

List<Movie> movies = List();
Stream<List> getMovieSearch(String text) {
  Firestore.instance.collection("movies").getDocuments().then(
        (QuerySnapshot querySnapshot) => {
          querySnapshot.documents.forEach((doc) {
            if (doc["title"].toLowerCase().indexOf(text.toLowerCase()) > -1) {
              Movie movieModel = Movie.fromMap(doc.data);
              movies.add(movieModel);
            }
          })
        },
      );
}
