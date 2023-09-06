import 'package:flutter/material.dart';
import 'package:storeapp/helper/api.dart';
import 'package:storeapp/models/product_model.dart';

class UpdateProductService {
  Future<ProductModel> updateProduct(
      {required var title,
      required int id,
      required var price,
      required String desc,
      required String image,
      required String category}) async {
    Map<String, dynamic> data =
        await Api().put(url: "https://fakestoreapi.com/products/$id", body: {
      "title": title,
      "price": price,
      "description": desc,
      "image": image,
      "category": category
    });
    return ProductModel.fromJson(jsonData: data);
  }
}
