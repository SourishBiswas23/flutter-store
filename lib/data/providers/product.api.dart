import 'package:dio/dio.dart';

class ProductApi {
  final _dio = Dio(BaseOptions(baseUrl: 'https://fakestoreapi.com/products'));
}
