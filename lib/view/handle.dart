import 'dart:developer';

import 'package:cf_info_app/view/first.dart';
import 'package:cf_info_app/model/functions.dart';
import 'package:cf_info_app/model/profile_response.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: Scaffold(
          appBar: AppBar(
            title: const Text('Codeforces Profile Fetching'),
          ),
          body: Center(
            child: HandleForm(),
          ),
        ));
  }
}

class HandleForm extends StatelessWidget {
  HandleForm({Key? key}) : super(key: key);

  final handleController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 32),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextFormField(
              controller: handleController,
              decoration: InputDecoration(
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15.0),
                  borderSide: const BorderSide(
                    color: Colors.blue,
                    width: 2.0,
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15.0),
                  borderSide: const BorderSide(
                    color: Colors.blue,
                    width: 2.0,
                  ),
                ),
                labelText: 'Enter a codeforces handle',
              ),
            ),
            ElevatedButton(
              onPressed: () {
                var profileInfoFuture =
                    fetchProfileResponse(handleController.text);
                profileInfoFuture.then((value) {
                  log('data: ${value.status}');
                  handleController.clear();
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => ProfileRoute(value.profile)));
                }).catchError((error) {
                  log('error: ${error.toString()}');
                  _showSnackBar(context, error.toString());
                });
              },
              child: const Text('GO'),
              style: ElevatedButton.styleFrom(
                  minimumSize: const Size.fromHeight(40),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0))),
            )
          ],
        ));
  }

  void _showSnackBar(BuildContext context, String message) {
    final snackBar = SnackBar(content: Text(message));
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
}
