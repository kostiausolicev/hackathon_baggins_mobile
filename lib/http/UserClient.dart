import 'dart:convert';
import 'package:http/http.dart' as http;

import '../dto/user/AuthUserDto.dart';
import '../dto/user/CreateUserDto.dart';
import '../dto/user/SuccessAuthDto.dart';
import '../dto/user/UpdateUserDto.dart';
import '../exception/ForbiddenException.dart';
import '../exception/UnauthorizedException.dart';
import '../static/AppSettings.dart';

const String baseUrl = 'http://yourapiurl.com/users';

class UserClient {
  Future<http.Response> getAll({int limit = 10, int page = 0}) async {
    final url = Uri.parse(baseUrl).replace(queryParameters: {
      'limit': '$limit',
      'page': '$page',
    });
    final token = Settings.token ?? (throw Exception('Token not found'));

    final response = await http.get(
      url,
      headers: {
        'Authorization': 'Bearer $token',
      },
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

  Future<http.Response> getByUuid(String uuid) async {
    final url = Uri.parse('$baseUrl/$uuid');
    final token = Settings.token ?? (throw Exception('Token not found'));

    final response = await http.get(
      url,
      headers: {
        'Authorization': 'Bearer $token',
      },
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

  Future<http.Response> register(CreateUserDto dto) async {
    final url = Uri.parse('$baseUrl/register');

    final response = await http.post(
      url,
      headers: {
        'Content-Type': 'application/json',
      },
      body: dto.toJsonString(),
    );

    if (response.statusCode == 200 || response.statusCode == 201) {
      return response;
    } else {
      throw Exception('Failed to register user');
    }
  }

  Future<SuccessAuthDto> auth(AuthUserDto dto) async {
    final url = Uri.parse('$baseUrl/auth');

    final response = await http.post(
      url,
      headers: {
        'Content-Type': 'application/json',
      },
      body: dto.toJsonString(),
    );

    if (response.statusCode == 200) {
      var success = SuccessAuthDto.fromJson(jsonDecode(response.body));
      Settings.token = success.token;
      Settings.role = success.role;
      return success;
    } else {
      throw Exception('Failed to authenticate user');
    }
  }

  Future<http.Response> conform(String uuid, String role) async {
    final url = Uri.parse('$baseUrl/conform/$uuid').replace(queryParameters: {
      'role': role,
    });
    final token = Settings.token ?? (throw Exception('Token not found'));

    final response = await http.post(
      url,
      headers: {
        'Authorization': 'Bearer $token',
      },
    );

    if (response.statusCode == 200) {
      return response;
    } else if (response.statusCode == 401) {
      Settings.token = null;
      throw UnauthorizedException();
    } else if (response.statusCode == 403) {
      throw ForbiddenException();
    } else {
      throw Exception('Failed to conform user');
    }
  }

  Future<http.Response> unconform(String uuid) async {
    final url = Uri.parse('$baseUrl/unconform/$uuid');
    final token = Settings.token ?? (throw Exception('Token not found'));

    final response = await http.post(
      url,
      headers: {
        'Authorization': 'Bearer $token',
      },
    );

    if (response.statusCode == 200) {
      return response;
    } else if (response.statusCode == 401) {
      Settings.token = null;
      throw UnauthorizedException();
    } else if (response.statusCode == 403) {
      throw ForbiddenException();
    } else {
      throw Exception('Failed to unconform user');
    }
  }

  Future<http.Response> update(UpdateUserDto dto) async {
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
      throw Exception('Failed to update user');
    }
  }
}
