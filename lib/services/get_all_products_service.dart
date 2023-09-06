import 'package:storeapp/helper/api.dart';
import 'package:storeapp/models/product_model.dart';

class GetAllProductService {
  Future<List<ProductModel>> getAllProduct() async {
    List<dynamic> data = await Api().get(
      url: "https://fakestoreapi.com/products",
    );
    List<ProductModel> productList = [];
    for (int i = 0; i < data.length; i++) {
      productList.add(ProductModel.fromJson(jsonData: data[i]));
    }
    return productList;
  }
}
