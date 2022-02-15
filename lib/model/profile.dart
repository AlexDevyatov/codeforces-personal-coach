import 'package:json_annotation/json_annotation.dart';

part 'profile.g.dart';

@JsonSerializable()
class Profile {
  final String handle;
  final int rating;
  final String titlePhoto;
  final String rank;

  Profile({
    required this.handle,
    required this.rating,
    required this.titlePhoto,
    required this.rank
  });

  factory Profile.fromJson(Map<String, dynamic> json) => _$ProfileFromJson(json);

  Map<String, dynamic> toJson() => _$ProfileToJson(this);
}
