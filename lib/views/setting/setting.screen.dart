import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:porhub_flutter/views/setting/components/accountsetting.dart';
import 'package:porhub_flutter/views/setting/components/moresetting.dart';
import 'package:porhub_flutter/views/setting/components/profileuser.dart';
import 'package:provider/provider.dart';

class SettingScreen extends StatelessWidget {
  const SettingScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final firebaseUser = context.watch<User>();
    return ListView(
      children: <Widget>[
        Column(
          children: <Widget>[
            ProfileUser(firebaseUser: firebaseUser),
            AccountSetting(),
            MoreSetting(),
          ],
        )
      ],
    );
  }
}
