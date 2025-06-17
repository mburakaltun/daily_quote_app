class ResponseStartResetPassword {
  final bool emailSent;

  ResponseStartResetPassword({this.emailSent = false});

  factory ResponseStartResetPassword.fromJson(Map<String, dynamic> json) {
    return ResponseStartResetPassword(
      emailSent: json['emailSent'] ?? false,
    );
  }
}
