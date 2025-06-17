class ResponseCompleteResetPassword {
  final String userId;

  ResponseCompleteResetPassword({required this.userId});

  factory ResponseCompleteResetPassword.fromJson(Map<String, dynamic> json) {
    return ResponseCompleteResetPassword(
        userId: json['userId'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {'userId': userId};
  }
}
