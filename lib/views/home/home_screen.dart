import 'package:flutter/material.dart';
import 'package:porhub_flutter/views/home/components/body.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black87,
      child: Body(),
    );
  }
}
