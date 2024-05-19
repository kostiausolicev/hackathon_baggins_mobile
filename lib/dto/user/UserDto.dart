import 'dart:convert';
import 'dart:ffi';

import 'package:flutter_app/dto/capabilities/CapabilitiesDto.dart';

class UserDto {
  String uuid;
  String email;
  String firstName;
  String lastName;
  Bool isConform;
  CapabilitiesDto capabilities; // Доступы
  String role; // Роль USER/ADMIN

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
      firstName: json['firstName'],
      lastName: json['lastName'],
      isConform: json['isConform'],
      capabilities: CapabilitiesDto.fromJson(json['capabilities']),
      role: json['role'],
    );
  }
}
