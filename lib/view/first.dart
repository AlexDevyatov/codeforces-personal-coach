import 'package:cf_info_app/model/functions.dart';
import 'package:cf_info_app/model/profile.dart';
import 'package:flutter/material.dart';
import '../model/profile_response.dart';

class ProfileRoute extends StatelessWidget {
  const ProfileRoute(this.profile, {Key? key}) : super(key: key);

  final Profile profile;

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Profile info'),
          automaticallyImplyLeading: false,
          actions: [
            PopupMenuButton(
              icon: const Icon(Icons.more_vert),
              itemBuilder: (context) => [
                const PopupMenuItem<int>(
                  value: 0,
                  child: Text('Reset profile'),
                ),
              ],
              onSelected: (item) => _selectMenuItem(context, item),
            ),
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(vertical: 32),
          child: SizedBox.expand(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  width: 150,
                  height: 150,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(color: Colors.black, width: 4),
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
      ),
    );
  }

  void _selectMenuItem(BuildContext context, item) {
    switch (item) {
      case 0:
        {
          Navigator.pop(context);
          break;
        }
    }
  }
}
