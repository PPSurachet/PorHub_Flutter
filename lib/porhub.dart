import 'package:flutter/material.dart';
import 'package:porhub_flutter/views/home/home_screen.dart';
import 'package:porhub_flutter/views/search/search_screen.dart';

class BuildPage extends StatefulWidget {
  BuildPage({Key key}) : super(key: key);

  @override
  _BuildPageState createState() => _BuildPageState();
}

class _BuildPageState extends State<BuildPage> {
  int _currentIndex = 0;

  List<Widget> tabs = [
    HomeScreen(),
    SearchScreen(),
    Center(
      child: Text("Favorite"),
    ),
    Center(
      child: Text("Setting"),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(),
      body: tabs[_currentIndex],
      bottomNavigationBar: buildBottomNavigationBar(),
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

  BottomNavigationBar buildBottomNavigationBar() {
    return BottomNavigationBar(
      currentIndex: _currentIndex,
      type: BottomNavigationBarType.fixed,
      backgroundColor: Colors.red[900],
      selectedItemColor: Colors.white,
      unselectedItemColor: Colors.grey[400],
      items: [
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          title: Text("Home"),
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.search),
          title: Text("Search"),
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.favorite),
          title: Text("Favorite"),
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.settings),
          title: Text("Setting"),
        ),
      ],
      onTap: (index) {
        setState(() {
          _currentIndex = index;
        });
      },
    );
  }
}
