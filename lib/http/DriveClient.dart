import 'dart:convert';

import 'package:flutter_app/dto/drive/AllFilesDto.dart';
import 'package:flutter_app/exception/ForbiddenException.dart';
import 'package:flutter_app/exception/UnauthorizedException.dart';
import 'package:flutter_app/static/HttpStatic.dart';
import 'package:http/http.dart' as http;

import '../dto/drive/CreateItemDto.dart';
import '../static/AppSettings.dart';

const String baseUrl = '${HttpStatic.url}:${HttpStatic.port}/drive';

Future<AllFilesDto> getAll({int limit = 10, String? pageToken, String? folderId}) async {
  final path = folderId == null ? baseUrl : "$baseUrl/$folderId";
  final url = Uri.parse(path).replace(queryParameters: {
    'limit': '$limit',
    if (pageToken != null) 'pageToken': pageToken,
  });
  final token = Settings.token ?? (throw Exception('Token not found'));
  final response = await http.get(
    url,
    headers: {
      'Authorization': "Bearer $token",
    },
  );

  if (response.statusCode == 200) {
    var body = response.body;
    return AllFilesDto.fromJson(jsonDecode(body));
  } else if (response.statusCode == 401) {
    Settings.token = null;
    throw UnauthorizedException();
  } else if (response.statusCode == 403) {
    throw ForbiddenException();
  } else {
    throw Exception('Failed to load data');
  }
}

Future<http.Response> create(CreateItemDto createItemDto) async {
  final url = Uri.parse(baseUrl);
  final token = Settings.token ?? (throw Exception('Token not found'));
  final response = await http.post(
    url,
    headers: {
      'Authorization': "Bearer $token",
      'Content-Type': 'application/json',
    },
    body: createItemDto.toJsonString(),
  );

  if (response.statusCode == 200) {
    return response;
  } else if (response.statusCode == 401) {
    Settings.token = null;
    throw UnauthorizedException();
  } else if (response.statusCode == 403) {
    throw ForbiddenException();
  } else {
    throw Exception('Failed to load data');
  }
}
