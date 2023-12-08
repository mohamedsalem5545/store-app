import 'dart:convert';

import 'package:store/halper/api.dart';
import 'package:store/models/product_model.dart';
import 'package:http/http.dart' as http;

class AllCategoriesService {
  Future<List<dynamic>> getAllCategories() async {
    List<dynamic> data =
        await Api().get(url: 'https://fakestoreapi.com/products/categories');

    return data;
  }
}
