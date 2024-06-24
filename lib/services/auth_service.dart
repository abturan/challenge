import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'dart:convert';
import 'package:cwtf_app/models/user_model.dart';

class AuthService with ChangeNotifier {
  UserModel? _user;
  String? _token;

  UserModel? get user => _user;
  bool get isAuthenticated => _user != null;

  final String baseUrl = 'http://localhost:3000/api/auth';
  final Dio _dio = Dio();

  AuthService() {
    // Configure Dio
    _dio.options = BaseOptions(
      baseUrl: baseUrl,
      connectTimeout: 5000,
      receiveTimeout: 3000,
      headers: {
        'Content-Type': 'application/json',
      },
    );
  }

  Future<void> register(String email, String password) async {
    try {
      final response = await _dio.post('/register', data: {
        'email': email,
        'password': password,
      });

      if (response.statusCode == 201) {
        final jsonResponse = response.data;
        if (jsonResponse.containsKey('token')) {
          _token = jsonResponse['token'];
          _user = _decodeJWT(_token!);
          notifyListeners();
          await login(email, password); // Auto-login after registration
        } else {
          throw Exception('Invalid response format');
        }
      } else {
        throw Exception('Failed to register');
      }
    } on DioError catch (e) {
      throw Exception('Error: ${e.response?.data ?? e.message}');
    }
  }

  Future<bool> login(String email, String password) async {
    try {
      final response = await _dio.post('/login', data: {
        'email': email,
        'password': password,
      });

      if (response.statusCode == 200) {
        final jsonResponse = response.data;
        if (jsonResponse.containsKey('token')) {
          _token = jsonResponse['token'];
          _user = _decodeJWT(_token!);
          notifyListeners();
          return true;
        } else {
          throw Exception('Invalid response format');
        }
      } else {
        throw Exception('Failed to login');
      }
    } on DioError catch (e) {
      throw Exception('Error: ${e.response?.data ?? e.message}');
    }
  }

  UserModel _decodeJWT(String token) {
    final parts = token.split('.');
    if (parts.length != 3) {
      throw Exception('Invalid token');
    }
    final payload = _decodeBase64(parts[1]);
    final payloadMap = json.decode(payload);
    if (payloadMap is! Map<String, dynamic>) {
      throw Exception('Invalid payload');
    }
    return UserModel.fromJson(payloadMap);
  }

  String _decodeBase64(String str) {
    String output = str.replaceAll('-', '+').replaceAll('_', '/');
    switch (output.length % 4) {
      case 0:
        break;
      case 2:
        output += '==';
        break;
      case 3:
        output += '=';
        break;
      default:
        throw Exception('Illegal base64url string!"');
    }
    return utf8.decode(base64Url.decode(output));
  }

  void logout() {
    _user = null;
    _token = null;
    notifyListeners();
  }
}