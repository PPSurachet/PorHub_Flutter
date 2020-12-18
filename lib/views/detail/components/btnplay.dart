import 'package:flutter/material.dart';
import 'package:porhub_flutter/models/movie.dart';

class BuildPlayBtn extends StatelessWidget {
  const BuildPlayBtn({
    Key key,
    @required this.record,
  }) : super(key: key);

  final Movie record;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.95,
      height: MediaQuery.of(context).size.height * 0.06,
      child: FlatButton(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        color: Colors.blue.shade700,
        child: Text(
          "Play",
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
        onPressed: () => print("Play " + record.title),
      ),
    );
  }
}
