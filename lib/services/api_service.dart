import 'package:dio/dio.dart';

class ApiService {
  final Dio _dio = Dio();

  Future<List<dynamic>> fetchChallenges() async {
    try {
      final response = await _dio.get('http://localhost:3000/api/challenges');
      return response.data;
    } catch (e) {
      throw Exception('Failed to load challenges');
    }
  }
}
