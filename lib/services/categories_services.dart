import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:store/halper/api.dart';
import 'package:store/models/product_model.dart';

class CategoriesService {
  Future<List<productModel>> getCategoriesProducts(
      {required String categoryName}) async {
    List<dynamic> data = await Api()
        .get(url: 'https://fakestoreapi.com/products/category/$categoryName');

    List<productModel> productsList = [];
    for (int i = 0; i < data.length; i++) {
      productsList.add(
        productModel.fromjson(data[i]),
      );
    }
    return productsList;
  }
}
