import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class ProfileUser extends StatelessWidget {
  const ProfileUser({
    Key key,
    @required this.firebaseUser,
  }) : super(key: key);

  final User firebaseUser;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Row(
        children: <Widget>[
          ClipRRect(
            borderRadius: BorderRadius.circular(360),
            child: Image.network(
              firebaseUser.photoURL,
              height: 65,
            ),
          ),
          SizedBox(width: 10),
          Text(
            firebaseUser.displayName,
            style: TextStyle(
              fontSize: 23,
              color: Colors.white,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }
}
