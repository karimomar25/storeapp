part of 'get_products_cubit.dart';

sealed class GetProductsState {}

final class GetProductsInitial extends GetProductsState {}

class ProductsLoading extends GetProductsState {}

class ProductsSuccess extends GetProductsState {
  List<ProductModel> productsList;
  ProductsSuccess({required this.productsList});
}

class ProductsFailure extends GetProductsState {}
