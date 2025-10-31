import 'package:flutter/material.dart';
import 'package:online_store/models/product_model.dart';
import 'package:online_store/screens/cart_page.dart';
import 'package:online_store/screens/home_page.dart';
import 'package:online_store/screens/product_details_page.dart';
import 'package:online_store/screens/updata_product_page.dart';
import 'package:online_store/services/update_product.dart';

void main() {
  runApp(StoreApp());

}
class StoreApp extends StatelessWidget {
  const   StoreApp({Key? key}):super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,

      routes:{
        HomePage.id  : (context)  => HomePage(),
        UpdateProductPage.id : (context) =>UpdateProductPage(),
        CartPage.id : (context)=>CartPage(),
        ProductDetailsPage.id: (context){
          final product=ModalRoute.of(context)!.settings.arguments as ProductModel;
      return    ProductDetailsPage(product: product);
        }
      },
      initialRoute: HomePage.id ,



    );
  }


}
