// product_details_page.dart
import 'package:flutter/material.dart';
import 'package:online_store/screens/updata_product_page.dart';
import '../models/product_model.dart';
import '../services/cartService.dart';


class ProductDetailsPage extends StatelessWidget {
  static String id = 'ProductDetailsPage';
  final ProductModel product;

  ProductDetailsPage({required this.product});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Product Details'),
        backgroundColor: Colors.blue,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // صورة المنتج كبيرة
            Container(
              height: 300,
              width: double.infinity,
              child: Image.network(
                product.image,
                fit: BoxFit.contain,
              ),
            ),

            Padding(
              padding: EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    product.title,
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 10),

                  Text(
                    '\$${product.price}',
                    style: TextStyle(fontSize: 24, color: Colors.green, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 10),

                  Row(
                    children: [
                      Icon(Icons.star, color: Colors.amber),
                      Text(' ${product.rating.rate} (${product.rating.count} Evaluation)'),
                    ],
                  ),
                  SizedBox(height: 20),

                  Text(
                    'Description:',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  Text(product.description),
                  SizedBox(height: 30),

                  // زر إضافة للسلة
                  Container(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {
                        CartService.addToCart(product);
                        ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text('The product has been added to the basket'),
                              backgroundColor: Colors.green,
                            )
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blue,
                        padding: EdgeInsets.symmetric(vertical: 16),
                      ),
                      child: Text(
                        'Add to the basket',
                        style: TextStyle(fontSize: 18, color: Colors.white),
                      ),
                    ),
                  ),

                  // زر التعديل (للمسؤول فقط)
                  Container(
                    width: double.infinity,
                    child: TextButton(
                      onPressed: () {
                        Navigator.pushNamed(context, UpdateProductPage.id, arguments: product);
                      },
                      child: Text('Product modification', style: TextStyle(color: Colors.blue)),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}