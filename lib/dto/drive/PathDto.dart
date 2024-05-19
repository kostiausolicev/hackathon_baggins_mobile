import 'dart:convert';

class PathDto {
  String name; // Название папки
  String id; // Id в гугл диске

  PathDto({
    required this.name,
    required this.id
  });

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'id': id
    };
  }

  String toJsonString() {
    return jsonEncode(toJson());
  }

  factory PathDto.fromJson(Map<String, dynamic> json) {
    return PathDto(
      id: json['id'],
      name: json['name'],
    );
  }
}