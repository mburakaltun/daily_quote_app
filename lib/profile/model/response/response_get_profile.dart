class ResponseGetProfile {
  final String username;
  final String email;

  ResponseGetProfile({
    required this.username,
    required this.email,
  });

  factory ResponseGetProfile.fromJson(Map<String, dynamic> json) {
    return ResponseGetProfile(
      username: json['username'],
      email: json['email'],
    );
  }
}