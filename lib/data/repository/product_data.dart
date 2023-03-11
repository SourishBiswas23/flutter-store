import 'package:dio/dio.dart';
import 'package:store/data/models/error_model.dart';
import 'package:store/data/providers/product.api.dart';

import '../models/product_model.dart';

class ProductData {
  getProductListByCategory({required String category}) async {
    try {
      var response = await ProductApi().getRawProductsByCategory(
        category: category,
      );
      if (response.statusCode == 200) {
        List responseData = response.data;
        List<Map<String, dynamic>> json = [];
        for (var element in responseData) {
          json.add(element);
        }
        List<ProductModel> productList = _mapRawDataToProductList(data: json);
        if (productList.isEmpty) {
          return ErrorModel(
            errorMessage: "We could'nt find the product you were looking for",
          );
        }
        return productList;
      } else {
        return ErrorModel(
          errorMessage:
              response.statusMessage ?? 'Check the product_data.dart file',
        );
      }
    } catch (e) {
      return ErrorModel(errorMessage: e.toString());
    }
  }

  getProductById({required String id}) async {
    try {
      var response = await ProductApi().getRawProductById(id: id);
      if (response.statusCode == 200) {
        if (response.data == null) {
          return ErrorModel(
            errorMessage: "We could'nt find the product you were looking for",
          );
        }
        final ProductModel product = ProductModel.fromJson(json: response.data);
        return product;
      } else {
        return ErrorModel(
          errorMessage:
              response.statusMessage ?? 'Check the product_data.dart file',
        );
      }
    } catch (e) {
      return ErrorModel(errorMessage: e.toString());
    }
  }

  _mapRawDataToProductList({required List<Map<String, dynamic>> data}) {
    List<ProductModel> products = [];
    for (var element in data) {
      products.add(ProductModel.fromJson(json: element));
    }
    return products;
  }
}
