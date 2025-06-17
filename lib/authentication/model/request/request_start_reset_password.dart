class RequestStartResetPassword {
  final String email;

  RequestStartResetPassword({
    required this.email,
  });

  Map<String, dynamic> toJson() {
    return {
      'email': email,
    };
  }
}