import 'package:flutter/material.dart';
import 'package:porhub_flutter/models/movie.dart';

class BuildPosterMovie extends StatelessWidget {
  const BuildPosterMovie({
    Key key,
    @required this.record,
  }) : super(key: key);

  final Movie record;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: MediaQuery.of(context).size.height * 0.6,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: NetworkImage(record.posterURL),
              fit: BoxFit.fill,
            ),
          ),
          child: Center(
            child: Container(
              height: MediaQuery.of(context).size.height * 0.4,
              decoration: BoxDecoration(
                border: Border.all(
                  color: Colors.white,
                  width: 5,
                ),
                borderRadius: BorderRadius.circular(15),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(15),
                child: Image.network(record.posterURL),
              ),
            ),
          ),
        ),
        Container(
          margin: EdgeInsets.only(top: 15, left: 20),
          decoration: BoxDecoration(
            color: Colors.white70,
            borderRadius: BorderRadius.circular(360),
          ),
          child: SafeArea(
            child: BackButton(
              color: Colors.black,
            ),
          ),
        ),
      ],
    );
  }
}
