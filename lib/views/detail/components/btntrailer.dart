import 'package:flutter/material.dart';
import 'package:porhub_flutter/models/movie.dart';

class BuildTrailerBtn extends StatelessWidget {
  const BuildTrailerBtn({
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
        color: Colors.grey.shade200,
        child: Text(
          "Watch Trailer",
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
        onPressed: () => print("Trailer " + record.title),
      ),
    );
  }
}
