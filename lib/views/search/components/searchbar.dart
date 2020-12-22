import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:porhub_flutter/views/search/components/listmovie.dart';

class BuildSearchBar extends StatefulWidget {
  final User firebaseUser;
  BuildSearchBar({Key key, this.firebaseUser}) : super(key: key);

  @override
  _BuildSearchBarState createState() => _BuildSearchBarState();
}

class _BuildSearchBarState extends State<BuildSearchBar> {
  String searchResult;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.82,
      child: Column(
        children: [
          ListTile(
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
              onChanged: (value) {
                setState(() {
                  searchResult = value.toLowerCase();
                });
              },
            ),
          ),
          BuildMovieSearch(
            searchResult: searchResult,
            firebaseUser: widget.firebaseUser,
          ),
        ],
      ),
    );
  }
}
