import 'dart:convert';

import 'package:cf_info_app/model/profile.dart';
import 'package:cf_info_app/view/handle_screen.dart';
import 'package:cf_info_app/view/profile_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]).then((_) {
    runApp(new StartScreen());
  });
}

class StartScreen extends StatelessWidget {
  const StartScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        body: FutureBuilder(
            future: _getWidget(),
            builder: (BuildContext context, AsyncSnapshot<Widget> snapshot) {
              if (snapshot.hasData) {
                return snapshot.requireData;
              } else if (snapshot.hasError) {
                return const Center(
                  child: Text('Error'),
                );
              } else {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
            }),
      ),
    );
  }

  Future<Widget> _getWidget() async {
    final prefs = await SharedPreferences.getInstance();
    final profilePref = prefs.getString('profile');
    if (profilePref != null) {
      final profile = Profile.fromJson(jsonDecode(profilePref));
      return ProfileScreen(profile);
    } else {
      return const EnterHandleScreen();
    }
  }
}
