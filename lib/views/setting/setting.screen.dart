import 'package:flutter/material.dart';
import 'package:porhub_flutter/views/setting/components/accountsetting.dart';
import 'package:porhub_flutter/views/setting/components/moresetting.dart';
import 'package:porhub_flutter/views/setting/components/profileuser.dart';

class SettingScreen extends StatelessWidget {
  const SettingScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        Column(
          children: <Widget>[
            ProfileUser(),
            AccountSetting(),
            MoreSetting(),
          ],
        )
      ],
    );
  }
}
