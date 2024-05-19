import 'dart:convert';
import 'package:flutter_app/dto/capabilities/CapabilitiesDto.dart';
import 'package:http/http.dart' as http;

import '../dto/capabilities/CreateCapabilitiesDto.dart';
import '../dto/capabilities/UpdateCapabilitiesDto.dart';
import '../exception/ForbiddenException.dart';
import '../exception/UnauthorizedException.dart';
import '../static/AppSettings.dart';
import '../static/HttpStatic.dart';

const String baseUrl = '${HttpStatic.url}:${HttpStatic.port}/capabilities';

Future<List<CapabilitiesDto>> getAll() async {
  final url = Uri.parse(baseUrl);
  final token = Settings.token ?? (throw Exception('Token not found'));

  final response = await http.get(
    url,
    headers: {
      'Authorization': 'Bearer $token',
    },
  );

  if (response.statusCode == 200) {
    List<dynamic> jsonList = jsonDecode(response.body);
    return jsonList.map((json) => CapabilitiesDto.fromJson(json)).toList();
  } else if (response.statusCode == 401) {
    Settings.token = null;
    throw UnauthorizedException();
  } else if (response.statusCode == 403) {
    throw ForbiddenException();
  } else {
    throw Exception('Failed to load data');
  }
}

Future<http.Response> create(CreateCapabilitiesDto dto) async {
  final url = Uri.parse(baseUrl);
  final token = Settings.token ?? (throw Exception('Token not found'));

  final response = await http.post(
    url,
    headers: {
      'Authorization': 'Bearer $token',
      'Content-Type': 'application/json',
    },
    body: dto.toJsonString(),
  );

  if (response.statusCode == 200 || response.statusCode == 201) {
    return response;
  } else if (response.statusCode == 401) {
    Settings.token = null;
    throw UnauthorizedException();
  } else if (response.statusCode == 403) {
    throw ForbiddenException();
  } else {
    throw Exception('Failed to create item');
  }
}

Future<http.Response> update(UpdateCapabilitiesDto dto) async {
  final url = Uri.parse(baseUrl);
  final token = Settings.token ?? (throw Exception('Token not found'));

  final response = await http.patch(
    url,
    headers: {
      'Authorization': 'Bearer $token',
      'Content-Type': 'application/json',
    },
    body: dto.toJsonString(),
  );

  if (response.statusCode == 200) {
    return response;
  } else if (response.statusCode == 401) {
    Settings.token = null;
    throw UnauthorizedException();
  } else if (response.statusCode == 403) {
    throw ForbiddenException();
  } else {
    throw Exception('Failed to update item');
  }
}
