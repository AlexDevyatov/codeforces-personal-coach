import 'package:json_annotation/json_annotation.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

part 'submission.g.dart';

@JsonSerializable()
class Submission {
  final int id;
  final int creationTimeSeconds;
  final String programmingLanguage;
  final String verdict;

  Submission(this.id, this.creationTimeSeconds, this.programmingLanguage,
      this.verdict);

  factory Submission.fromJson(Map<String, dynamic> json) =>
      _$SubmissionFromJson(json);

  Map<String, dynamic> toJson() => _$SubmissionToJson(this);
}
