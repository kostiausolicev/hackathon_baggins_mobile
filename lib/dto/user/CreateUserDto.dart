import 'dart:convert';

class CreateUserDto {
  String email;
  String firstName;
  String lastName;
  String password;
  String repeatPassword;

  CreateUserDto({
    required this.email,
    required this.firstName,
    required this.lastName,
    required this.password,
    required this.repeatPassword,
  });

  Map<String, dynamic> toJson() {
    return {
      'email': email,
      'firstName': firstName,
      'lastName': lastName,
      'password': password,
      'repeatPassword': repeatPassword,
    };
  }

  String toJsonString() {
    return jsonEncode(toJson());
  }
}
