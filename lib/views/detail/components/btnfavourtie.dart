import 'package:flutter/material.dart';
import 'package:porhub_flutter/models/movie.dart';

class BuildFavourBtn extends StatelessWidget {
  const BuildFavourBtn({
    Key key,
    @required this.record,
  }) : super(key: key);

  final Movie record;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.9,
      height: MediaQuery.of(context).size.height * 0.06,
      child: FlatButton(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(5),
        ),
        color: Colors.red[900],
        child: Text(
          "Add Favourite",
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
        onPressed: () => print(record.title),
      ),
    );
  }
}
