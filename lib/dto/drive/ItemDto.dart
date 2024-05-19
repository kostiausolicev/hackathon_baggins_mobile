import 'dart:convert';

import '../../enum/ItemType.dart';

class ItemDto {
  String name; // Название
  String id; // ID на гугл диске
  ItemType type; // тип

  ItemDto({required this.name, required this.id, required this.type});

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'id': id,
      'type': type,
    };
  }

  String toJsonString() {
    return jsonEncode(toJson());
  }

  factory ItemDto.fromJson(Map<String, dynamic> json) {
    return ItemDto(
      id: json['id'],
      name: json['name'],
      type: itemTypeFromString(json['type']),
    );
  }
}
