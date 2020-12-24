import 'package:flutter/material.dart';
import 'package:porhub_flutter/views/home/components/action.dart';
import 'package:porhub_flutter/views/home/components/adventure.dart';
import 'package:porhub_flutter/views/home/components/horror.dart';
import 'package:porhub_flutter/views/home/components/recommend.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        Column(
          children: [
            RecommendMovie(),
            SizedBox(height: 10),
            ActionMovie(),
            SizedBox(height: 10),
            AdventureMovie(),
            SizedBox(height: 10),
            HorrorMovie(),
            SizedBox(height: 10),
          ],
        ),
      ],
    );
  }
}
