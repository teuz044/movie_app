// ignore_for_file: depend_on_referenced_packages
import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class DioClient {
  static final dio = Dio(BaseOptions(
      baseUrl: 'https://api.themoviedb.org/3/',
      connectTimeout: const Duration(seconds: 30),
      receiveTimeout: const Duration(seconds: 60),
      headers: {
        "authorization": "Bearer ${dotenv.env['APIKEY']}",
      })); // With default `Options`.
}
