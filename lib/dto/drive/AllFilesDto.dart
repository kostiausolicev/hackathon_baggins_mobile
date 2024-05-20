import 'dart:convert';

import 'ItemDto.dart';
// Список файлов
class AllFilesDto {
  String? nextPage;
  List<ItemDto> items; // Сами файлы

  AllFilesDto({
    required this.nextPage,
    required this.items,
  });

  Map<String, dynamic> toJson() {
    return {
      'name': nextPage,
      'id': items,
    };
  }

  String toJsonString() {
    return jsonEncode(toJson());
  }

  factory AllFilesDto.fromJson(Map<String, dynamic> json) {
    var itemList = json['items'] as List;
    List<ItemDto> items = itemList.map((i) => ItemDto.fromJson(i)).toList();

    return AllFilesDto(
      nextPage: json['nextPage'],
      items: items,
    );
  }
}