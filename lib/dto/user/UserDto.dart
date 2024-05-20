import 'dart:convert';

import 'package:flutter_app/dto/capabilities/CapabilitiesDto.dart';

class UserDto {
  String uuid;
  String email;
  String firstName;
  String lastName;
  bool isConform;
  CapabilitiesDto? capabilities; // Доступы
  String? role; // Роль USER/ADMIN

  UserDto(
      {required this.uuid,
      required this.email,
      required this.firstName,
      required this.lastName,
      required this.isConform,
      required this.capabilities,
      required this.role});

  Map<String, dynamic> toJson() {
    return {
      'uuid': uuid,
      'email': email,
      'firstName': firstName,
      'lastName': lastName,
      'isConform': isConform,
      'capabilities': capabilities,
      'role': role,
    };
  }

  String toJsonString() {
    return jsonEncode(toJson());
  }

  factory UserDto.fromJson(Map<String, dynamic> json) {
    return UserDto(
      uuid: json['uuid'],
      email: json['email'],
      firstName: utf8.decode(json['firstName'].codeUnits),
      lastName: utf8.decode(json['lastName'].codeUnits),
      isConform: json['isConform'],
      capabilities: json['capabilities'] != null ? CapabilitiesDto.fromJson(json['capabilities']) : null,
      role: json['role'],
    );
  }
}
