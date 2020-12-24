import 'package:flutter/material.dart';

class AccountSetting extends StatefulWidget {
  AccountSetting({Key key}) : super(key: key);

  @override
  _AccountSettingState createState() => _AccountSettingState();
}

class _AccountSettingState extends State<AccountSetting> {
  bool nontification = true;
  bool update = true;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          title: Text(
            "Account Setting",
            style: TextStyle(
              fontSize: 20,
              color: Colors.white.withOpacity(0.5),
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        ListTile(
          title: Text(
            "Edit Profile",
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
          onTap: () {},
        ),
        ListTile(
          title: Text(
            "Change Password",
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
          onTap: () {},
        ),
        ListTile(
          title: Text(
            "Add a payment method",
            style: TextStyle(
              fontSize: 20,
              color: Colors.white,
              fontWeight: FontWeight.w600,
            ),
          ),
          trailing: Icon(
            Icons.add,
            size: 30,
            color: Colors.white,
          ),
        ),
        ListTile(
          title: Text(
            "Push notifications",
            style: TextStyle(
              fontSize: 20,
              color: Colors.white,
              fontWeight: FontWeight.w600,
            ),
          ),
          trailing: Switch(
            activeColor: Colors.pink,
            value: nontification,
            onChanged: (value) {
              setState(() {
                nontification = value;
              });
            },
          ),
        ),
        ListTile(
          title: Text(
            "Auto Update",
            style: TextStyle(
              fontSize: 20,
              color: Colors.white,
              fontWeight: FontWeight.w600,
            ),
          ),
          trailing: Switch(
            activeColor: Colors.pink,
            value: update,
            onChanged: (value) {
              setState(() {
                update = value;
              });
            },
          ),
        ),
      ],
    );
  }
}
