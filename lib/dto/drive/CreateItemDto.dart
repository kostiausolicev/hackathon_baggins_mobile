import 'dart:convert';

import 'package:flutter_app/enum/ItemType.dart';

class CreateItemDto {
  String name; // Название
  String parent; // ID родительской папки
  ItemType type; // тип папка/файл/прочее

  CreateItemDto({
    required this.name,
    required this.parent,
    required this.type
  });

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'parent': parent,
      'type': type.name
    };
  }

  String toJsonString() {
    return jsonEncode(toJson());
  }
}