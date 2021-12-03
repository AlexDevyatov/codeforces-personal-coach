import 'package:cf_info_app/model/functions.dart';
import 'package:cf_info_app/model/profile.dart';
import 'package:flutter/material.dart';
import 'model/profile_response.dart';

class ProfileRoute extends StatelessWidget {
  const ProfileRoute(this.profile, {Key? key}) : super(key: key);

  final Profile profile;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
            profile.handle,
            style: getStyle(profile.rating),
      ),
    ),);
  }
}
