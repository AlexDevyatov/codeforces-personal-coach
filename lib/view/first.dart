import 'package:cf_info_app/model/functions.dart';
import 'package:cf_info_app/model/profile.dart';
import 'package:flutter/material.dart';
import '../model/profile_response.dart';

class ProfileRoute extends StatelessWidget {
  const ProfileRoute(this.profile, {Key? key}) : super(key: key);

  final Profile profile;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 48),
        child: SizedBox.expand(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                width: 150,
                height: 150,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: Colors.black,
                    width: 4
                  ),
                  image: DecorationImage(
                      image: NetworkImage(profile.titlePhoto),
                      fit: BoxFit.cover),
                ),
              ),
              Container(
                  margin: const EdgeInsets.only(top: 10.0),
                  child: Text(
                    profile.handle,
                    style: getHandleStyle(profile.rating),
                  )),
              Container(
                  margin: const EdgeInsets.only(top: 10.0),
                  child: Text(
                    profile.rank,
                    style: getRankStyle(profile.rating),
                  )),
              Container(
                  margin: const EdgeInsets.only(top: 10.0),
                  child: Text(
                    profile.rating.toString(),
                    style: getRankStyle(profile.rating),
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
