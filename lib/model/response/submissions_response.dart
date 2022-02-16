import 'package:cf_info_app/model/submission.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

class SubmissionsResponse {
  final String status;
  final List<Submission> result;

  SubmissionsResponse(this.status, this.result);

  factory SubmissionsResponse.fromJson(Map<String, dynamic> json) {
    final status = json['status'];
    var submissionsJson = json['result'] as List;
    List<Submission> _submissions = submissionsJson
        .map((submissionJson) => Submission.fromJson(submissionJson))
        .toList();
    return SubmissionsResponse(status, _submissions);
  }
}

Future<SubmissionsResponse> fetchSubmissionsResponse(String handle) async {
  final response = await http.get(
      Uri.parse('https://codeforces.com/api/user.status?handle=$handle'));
  if (response.statusCode == 200) {
    return SubmissionsResponse.fromJson(convert.jsonDecode(response.body));
  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    throw Exception('Failed to load submissions');
  }
}
