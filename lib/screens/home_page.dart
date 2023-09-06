import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:storeapp/cubits/cubit/get_products_cubit.dart';
import 'package:storeapp/models/product_model.dart';
import 'package:storeapp/widgets/custom_card.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  static String id = "HomePage";

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    BlocProvider.of<GetProductsCubit>(context).getProducts();
  }

  @override
  Widget build(BuildContext context) {
    bool isLoading = false;
    List<ProductModel>? productsList = [];
    return Scaffold(
        appBar: AppBar(
          actions: [
            IconButton(
                onPressed: () {},
                icon: Icon(
                  FontAwesomeIcons.cartPlus,
                  color: Colors.black,
                ))
          ],
          title: Text(
            "New Trend",
            style: TextStyle(color: Colors.black),
          ),
          backgroundColor: Colors.white,
          centerTitle: true,
        ),
        body: Padding(
            padding: const EdgeInsets.only(top: 100, left: 16, right: 16),
            child: BlocConsumer<GetProductsCubit, GetProductsState>(
              listener: (context, state) {
                if (state is ProductsLoading) {
                  isLoading = true;
                } else if (state is ProductsSuccess) {
                  productsList = state.productsList;
                  isLoading = false;
                } else if (state is ProductsFailure) {
                  ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text("tere was an error")));
                  isLoading = false;
                }
              },
              builder: (context, state) {
                return ModalProgressHUD(
                  inAsyncCall: isLoading,
                  child: GridView.builder(
                    itemCount: productsList!.length,
                    clipBehavior: Clip.none,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        childAspectRatio: 1.5,
                        crossAxisSpacing: 10,
                        mainAxisSpacing: 100),
                    itemBuilder: (context, index) {
                      return CustomCard(
                        product: productsList![index],
                      );
                    },
                  ),
                );
              },
            )));
  }
}
