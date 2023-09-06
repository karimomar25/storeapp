import 'package:flutter/material.dart';
import 'package:storeapp/models/product_model.dart';
import 'package:storeapp/screens/update_page.dart';

class CustomCard extends StatelessWidget {
  CustomCard({super.key, required this.product});
  ProductModel product;
  
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(context, UpdatePage.id, arguments: product);
      },
      child: Stack(
        
        clipBehavior: Clip.none,
        children: [
          Card(
            elevation: 10,
            clipBehavior: Clip.none,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(product.title.substring(0, 6)),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(r"$" "${product.price.toString()}"),
                      Icon(
                        Icons.favorite,
                        color: Colors.red,
                      )
                    ],
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            bottom: 70,
            right: 10,
            child: Image.network(
              product.image,
              height: 100,
              width: 100,
            ),
          )
        ],
      ),
    );
  }
}
