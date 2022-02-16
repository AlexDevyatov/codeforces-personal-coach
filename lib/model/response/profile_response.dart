import '../profile.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

class ProfileResponse {
  final String status;
  final Profile profile;

  ProfileResponse({required this.status, required this.profile});

  factory ProfileResponse.fromJSON(Map<String, dynamic> json) {
    return ProfileResponse(
        status: json['status'], profile: Profile.fromJson(json['result'][0]));
  }
}

Future<ProfileResponse> fetchProfileResponse(String handle) async {
  final response = await http.get(
      Uri.parse('https://codeforces.com/api/user.info?handles=$handle'));

  if (response.statusCode == 200) {
    // If the server did return a 200 OK response,
    // then parse the JSON.
    return ProfileResponse.fromJSON(convert.jsonDecode(response.body));
  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    throw Exception('Failed to load profile');
  }
}