import 'package:dio/dio.dart';
import 'package:login_session/models/category_model';
import 'package:login_session/models/product_model.dart';

class StoreService {
  final Dio _dio = Dio();
  final String _baseUrl =
      'https://api.escuelajs.co/api/v1/categories'; // replace this with your real endpoint

  Future<List<CategoryModel>> fetchCategories() async {
    try {
      final response = await _dio.get(_baseUrl);

      if (response.statusCode == 200) {
        List data = response.data;
        return data.map((json) => CategoryModel.fromJson(json)).toList();
      } else {
        throw Exception('Failed to load categories');
      }
    } catch (e) {
      throw Exception('Error fetching categories: $e');
    }
  }

  Future<List<ProductModel>> fetchProducts(String category) async {
    try {
      final response = await _dio.get(
        "https://api.escuelajs.co/api/v1/products/?categorySlug=$category", // استبدل بالرابط الصحيح لو عندك
        options: Options(headers: {"Content-Type": "application/json"}),
      );

      if (response.statusCode == 200) {
        List<dynamic> jsonList = response.data;
        List<ProductModel> productList =
            jsonList.map((e) => ProductModel.fromJson(e)).toList();
        return productList;
      } else {
        throw Exception("Failed to load products");
      }
    } catch (e) {
      throw Exception("Failed to fetch products");
    }
  }
}
