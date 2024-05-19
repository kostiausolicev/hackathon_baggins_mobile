import 'dart:convert';

class AuthUserDto {
  String email;
  String password;

  AuthUserDto({
    required this.email,
    required this.password,
  });

  Map<String, dynamic> toJson() {
    return {
      'email': email,
      'password': password,
    };
  }

  String toJsonString() {
    return jsonEncode(toJson());
  }
}