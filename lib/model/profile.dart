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

  factory Profile.fromJson(Map<String, dynamic> json) {
    return Profile(
      handle: json['handle'],
      rating: json['rating'],
      titlePhoto: json['titlePhoto'],
      rank: json['rank']
    );
  }
}
