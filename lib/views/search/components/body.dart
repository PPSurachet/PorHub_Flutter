import 'package:flutter/material.dart';
import 'package:porhub_flutter/views/search/components/searchbar.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Column(
          children: [
            BuildSearchBar(),
          ],
        ),
      ],
    );
  }
}
