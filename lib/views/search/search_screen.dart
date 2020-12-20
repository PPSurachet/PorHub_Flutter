import 'package:flutter/material.dart';
import 'package:porhub_flutter/views/search/components/body.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black87,
      child: Body(),
    );
  }
}
