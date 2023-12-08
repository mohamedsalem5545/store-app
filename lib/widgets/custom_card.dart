import 'package:flutter/material.dart';
import 'package:store/models/product_model.dart';
import 'package:store/screans/update_product.dart';

class CustomCard extends StatelessWidget {
  CustomCard({
    required this.product,
    super.key,
  });

  productModel product;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, UpdateProductPage.id, arguments: product);
      },
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Container(
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  blurRadius: 40,
                  color: Colors.grey.withOpacity(.2),
                  spreadRadius: 0,
                  offset: Offset(10, 10),
                )
              ],
            ),
            child: Card(
              elevation: 10,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      product.title.substring(0, 6),
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: 16,
                      ),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          r'$' '${product.price.toString()}',
                          style: TextStyle(
                            fontSize: 16,
                          ),
                        ),
                        Icon(
                          Icons.favorite,
                          color: Colors.red,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
          Positioned(
            right: 32,
            bottom: 85,
            child: Image.network(
              product.image,
              height: 100,
              width: 100,
            ),
          ),
          // Image.network(
          //   '2FAVvXsEhwwVCFqT8sEgP81oklQDUpAHPD9fXzVHEm3MkOXG5BaphPMFG1L9BF9Fn1nXRK9QHthPZ7fWzlnhL8mWd7BopV_Exf7KnV7NjgUjaAuCDYsuXH4BVFQVBNjPiqCUEIQUEsqFVuV',
          //   height: 50,
          // ),
        ],
      ),
    );
  }
}