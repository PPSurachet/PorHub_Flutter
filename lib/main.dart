import 'package:flutter/material.dart';
import 'package:porhub_flutter/views/home/home_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: buildAppBar(),
        body: HomeScreen(),
      ),
    );
  }

  AppBar buildAppBar() {
    return AppBar(
      backgroundColor: Colors.red[900],
      title: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'POR',
            style: TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.bold,
              letterSpacing: 2,
            ),
          ),
          SizedBox(width: 3),
          Container(
            padding: EdgeInsets.fromLTRB(7, 5, 7, 5),
            child: Text(
              'HUB',
              style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold,
                letterSpacing: 2,
                color: Colors.black,
              ),
            ),
            decoration: BoxDecoration(
              color: Colors.yellow[800],
              borderRadius: BorderRadius.circular(15),
            ),
          ),
        ],
      ),
      centerTitle: true,
    );
  }
}
