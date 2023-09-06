import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:storeapp/models/product_model.dart';
import 'package:storeapp/services/get_all_products_service.dart';

part 'get_products_state.dart';

class GetProductsCubit extends Cubit<GetProductsState> {
  GetProductsCubit({required this.service}) : super(GetProductsInitial());
  GetAllProductService service;
  List<ProductModel> productsList = [];
  void getProducts() async {
    emit(ProductsLoading());

    try {
      productsList = await service!.getAllProduct();
      emit(ProductsSuccess(productsList: productsList));
    } catch (e) {
      emit(ProductsFailure());
    }
  }
}
