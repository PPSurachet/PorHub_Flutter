import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:porhub_flutter/views/favorite/components/buildlistmovie.dart';
import 'package:provider/provider.dart';

class FavoriteScreen extends StatelessWidget {
  const FavoriteScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final firebaseUser = context.watch<User>();
    return ListView(
      children: <Widget>[
        Container(
          padding: EdgeInsets.symmetric(vertical: 10),
          height: MediaQuery.of(context).size.height * 0.83,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              buildTextFavorite(),
              FavoriteMovie(firebaseUser: firebaseUser),
            ],
          ),
        )
      ],
    );
  }

  Container buildTextFavorite() {
    return Container(
      padding: EdgeInsets.fromLTRB(10, 5, 10, 10),
      child: Row(
        children: <Widget>[
          Icon(
            Icons.star,
            color: Colors.white,
            size: 30,
          ),
          SizedBox(width: 10),
          Text(
            "Favorite",
            style: TextStyle(
              fontSize: 30,
              color: Colors.white,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}
