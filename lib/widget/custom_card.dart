import 'package:flutter/material.dart';
import 'package:online_store/models/product_model.dart';
import 'package:online_store/screens/updata_product_page.dart';

import '../screens/product_details_page.dart';
import '../services/cartService.dart';

class CustomCard extends StatelessWidget {
  CustomCard({required this.product});
ProductModel product;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Navigator.pushNamed(context, ProductDetailsPage.id,arguments: product);

      },
    child:  Stack(
    clipBehavior: Clip.none,
    children: [
    Container(
    decoration: BoxDecoration(boxShadow: [
    BoxShadow(
    blurRadius: 40,
    color: Colors.grey.withOpacity(0.2),
    spreadRadius: 0,
    offset: Offset(10, 10))
    ]) ,

    child: Card(
    elevation: 10,
    child:Padding(padding:EdgeInsets.symmetric(horizontal: 16,vertical: 16),
    child: Column(
    mainAxisAlignment: MainAxisAlignment.end,
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
    Text(product.title.substring(0,6),style: TextStyle(color: Colors.grey,fontSize: 14),),
    SizedBox(height: 5,),
    Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
    Text( r'$' '${product.price.toString()}',style: TextStyle(color: Colors.black,fontSize: 14),),
    Icon(Icons.favorite,color: Colors.red,size: 18,),
    ],)],),),)),
    Positioned(
    bottom: 75,
    right: 20,
    child: Image.network(product.image,height: 100,width: 100,)
    )
    ]
    ) );
  }
}