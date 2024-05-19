import 'dart:convert';

class UpdateUserDto {
  String uuid;
  String? email;
  String? firstName;
  String? lastName;
  String? password;
  String? repeatPassword;
  String? capabilities;
  String? role;

  UpdateUserDto(
      {required this.uuid,
      required this.email,
      required this.firstName,
      required this.lastName,
      required this.password,
      required this.repeatPassword,
      required this.capabilities,
      required this.role});

  Map<String, dynamic> toJson() {
    return {
      'uuid': uuid,
      'email': email,
      'firstName': firstName,
      'lastName': lastName,
      'password': password,
      'repeatPassword': repeatPassword,
      'capabilities': capabilities,
      'role': role,
    };
  }

  String toJsonString() {
    return jsonEncode(toJson());
  }
}
