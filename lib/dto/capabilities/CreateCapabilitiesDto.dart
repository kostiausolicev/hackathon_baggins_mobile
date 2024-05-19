import 'dart:convert';

import '../drive/PathDto.dart';

class CreateCapabilitiesDto {
  String title; // Название
  List<PathDto> paths; // СПисок папок

  CreateCapabilitiesDto({
    required this.title,
    required this.paths
  });

  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'paths': paths
    };
  }

  String toJsonString() {
    return jsonEncode(toJson());
  }
}