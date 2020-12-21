import 'package:flutter/material.dart';
import 'package:porhub_flutter/authentication/authenticate_service.dart';
import 'package:provider/provider.dart';

class MoreSetting extends StatefulWidget {
  MoreSetting({Key key}) : super(key: key);

  @override
  _MoreSettingState createState() => _MoreSettingState();
}

class _MoreSettingState extends State<MoreSetting> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          title: Text(
            "More",
            style: TextStyle(
              fontSize: 20,
              color: Colors.white.withOpacity(0.5),
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        ListTile(
          title: Text(
            "About us",
            style: TextStyle(
              fontSize: 20,
              color: Colors.white,
              fontWeight: FontWeight.w600,
            ),
          ),
          trailing: Icon(
            Icons.arrow_forward_ios,
            color: Colors.white,
          ),
        ),
        ListTile(
          title: Text(
            "Privacy policy",
            style: TextStyle(
              fontSize: 20,
              color: Colors.white,
              fontWeight: FontWeight.w600,
            ),
          ),
          trailing: Icon(
            Icons.arrow_forward_ios,
            color: Colors.white,
          ),
        ),
        ListTile(
          title: Text(
            "Report",
            style: TextStyle(
              fontSize: 20,
              color: Colors.white,
              fontWeight: FontWeight.w600,
            ),
          ),
          trailing: Icon(
            Icons.arrow_forward_ios,
            color: Colors.white,
          ),
        ),
        ListTile(
          title: Text(
            "Sign Out",
            style: TextStyle(
              fontSize: 20,
              color: Colors.white,
              fontWeight: FontWeight.w600,
            ),
          ),
          trailing: Icon(
            Icons.exit_to_app,
            size: 30,
            color: Colors.white,
          ),
          onTap: () {
            context.read<AuthenicationService>().signOut();
          },
        ),
      ],
    );
  }
}
