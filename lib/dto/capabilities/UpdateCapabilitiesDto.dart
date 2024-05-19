import 'dart:convert';

import '../drive/PathDto.dart';

class UpdateCapabilitiesDto {
  String uuid; // ID
  String title; // Название
  List<PathDto> paths; // Пути

  UpdateCapabilitiesDto({
    required this.uuid,
    required this.title,
    required this.paths
  });

  Map<String, dynamic> toJson() {
    return {
      'uuid': uuid,
      'title': title,
      'paths': paths
    };
  }

  String toJsonString() {
    return jsonEncode(toJson());
  }
}