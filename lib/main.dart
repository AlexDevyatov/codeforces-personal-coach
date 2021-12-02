import 'package:cf_info_app/model/functions.dart';
import 'package:flutter/material.dart';
import 'model/profile_response.dart';

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
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  late Future<ProfileResponse> futureProfileResponse;

  @override
  void initState() {
    super.initState();
    futureProfileResponse = fetchProfileResponse();
  }

  @override
  Widget build(BuildContext context) {
    final profileHandle = FutureBuilder<ProfileResponse>(
      future: futureProfileResponse,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return Container(
            margin: const EdgeInsets.all(8.0),
            child: Text(
              snapshot.data!.profile.handle,
              style: getStyle(snapshot.data!.profile.rating),
            ),
          );
        } else if (snapshot.hasError) {
          return Text('${snapshot.error}');
        }
        return const CircularProgressIndicator();
      },
    );

    final profileRating = FutureBuilder<ProfileResponse>(
      future: futureProfileResponse,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return Container(
            margin: const EdgeInsets.all(8.0),
            child: Text(
              snapshot.data!.profile.rating.toString(),
              style: getStyle(snapshot.data!.profile.rating),
            ),
          );
        } else if (snapshot.hasError) {
          return Text('${snapshot.error}');
        }
        return const CircularProgressIndicator();
      },
    );

    final rightColumn = Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        profileHandle,
        profileRating
      ],
    );

    final profileAvatar = FutureBuilder<ProfileResponse>(
      future: futureProfileResponse,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return Container(
            width: 150,
            height: 150,
            margin: const EdgeInsets.all(8.0),
            child: Image.network(snapshot.data!.profile.titlePhoto),
          );
        } else if (snapshot.hasError) {
          return Text('${snapshot.error}');
        }
        return const CircularProgressIndicator();
      },
    );

    return MaterialApp(
      title: 'Fetch example',
      theme: ThemeData(
        primarySwatch: Colors.amber,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Codeforces Profile Fetching'),
        ),
        body: Container(
          padding: const EdgeInsets.all(8.0),
          child: Card(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [profileAvatar, rightColumn],
            ),
          ),
        ),
      ),
    );
  }
}
