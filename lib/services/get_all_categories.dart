import 'package:storeapp/helper/api.dart';
import 'package:storeapp/models/product_model.dart';

class GetAllCategories {
  Future<List> getAllCategories() async {
    List<dynamic> data =
        await Api().get(url: "https://fakestoreapi.com/products/categories");
    return data;
  }
}
