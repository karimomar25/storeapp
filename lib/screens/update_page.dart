import 'package:flutter/material.dart';
import 'package:storeapp/models/product_model.dart';
import 'package:storeapp/services/update_product_service.dart';
import 'package:storeapp/widgets/custom_button.dart';
import 'package:storeapp/widgets/custom_textfield.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class UpdatePage extends StatefulWidget {
  UpdatePage({super.key});
  static String id = "UpdatePage";

  @override
  State<UpdatePage> createState() => _UpdatePageState();
}

class _UpdatePageState extends State<UpdatePage> {
  String? productName, desc, image;

  String? price;
  bool isLoading = false;
  @override
  Widget build(BuildContext context) {
    ProductModel product =
        ModalRoute.of(context)!.settings.arguments as ProductModel;
    return ModalProgressHUD(
      inAsyncCall: isLoading,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          title: Text(
            "UpdatePage",
            style: TextStyle(color: Colors.black),
          ),
          centerTitle: true,
        ),
        body: Padding(
          padding: const EdgeInsets.all(15),
          child: Column(
            children: [
              CustomTextField(
                onChanged: (data) {
                  productName = data;
                },
                hintText: "Product Name",
              ),
              SizedBox(
                height: 10,
              ),
              CustomTextField(
                onChanged: (data) {
                  desc = data;
                },
                hintText: "Description",
              ),
              SizedBox(
                height: 10,
              ),
              CustomTextField(
                onChanged: (data) {
                  price = data.toString();
                },
                hintText: "Price",
                inputType: TextInputType.number,
              ),
              SizedBox(
                height: 10,
              ),
              CustomTextField(
                onChanged: (data) {
                  image = data;
                },
                hintText: "Image",
              ),
              SizedBox(
                height: 10,
              ),
              CustomButton(
                onTap: () async {
                  isLoading = true;
                  setState(() {});

                  await updateProduct(product);
                  print("succes");

                  isLoading = false;
                  setState(() {});
                },
              )
            ],
          ),
        ),
      ),
    );
  }

  Future<void> updateProduct(ProductModel product) async {
    await UpdateProductService().updateProduct(
      id: product.id,
      title: productName == null ? product.title : productName!,
      price: price == null ? product.price : price!,
      desc: desc == null ? product.desc : desc!,
      image: image == null ? product.image : image!,
      category: product.category,
    );
  }
}
