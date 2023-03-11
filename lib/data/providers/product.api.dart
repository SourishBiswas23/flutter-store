import 'package:dio/dio.dart';

class ProductApi {
  final _dio = Dio(BaseOptions(baseUrl: 'https://fakestoreapi.com/products'));

  Future<Response> getRawProductsByCategory({required String category}) async {
    final Map<String, String> catetoryToUrl = {
      'All': '',
      'Electronics': '/category/electronics',
      'Jewelery': '/category/jewelery',
      "Men's Clothing": "/category/men's%20clothing",
      "Women's Clothing": "/category/women's%20clothing",
    };

    final response = await _dio.get(catetoryToUrl[category] ?? '');
    return response;
  }

  Future<Response> getRawProductById({required String id}) async {
    final response = await _dio.get('/$id');
    return response;
  }
}
