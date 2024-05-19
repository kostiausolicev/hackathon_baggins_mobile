import 'dart:convert';

import '../drive/PathDto.dart';

// Модель досутпов
class CapabilitiesDto {
  String uuid; // id
  String title; // Название
  List<PathDto> paths; // Папки

  CapabilitiesDto({
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

  factory CapabilitiesDto.fromJson(Map<String, dynamic> json) {
    var pathList = json['paths'] as List;
    List<PathDto> paths = pathList.map((i) => PathDto.fromJson(i)).toList();

    return CapabilitiesDto(
      uuid: json['uuid'],
      title: json['title'],
      paths: paths,
    );
  }
}