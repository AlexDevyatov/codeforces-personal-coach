class Profile {
  final String handle;
  final int rating;
  final String titlePhoto;

  Profile({
    required this.handle,
    required this.rating,
    required this.titlePhoto
  });

  factory Profile.fromJson(Map<String, dynamic> json) {
    return Profile(
      handle: json['handle'],
      rating: json['rating'],
      titlePhoto: json['titlePhoto'],
    );
  }
}
