import 'package:dio/dio.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

class HttpClient {
  static final Dio _dio = Dio()
    ..interceptors
        .add(PrettyDioLogger(requestBody: true, responseHeader: true));

  static Dio get get => _dio;
}
