import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:online_store/models/product_model.dart';
import 'package:online_store/services/get_all_product_service.dart';
import 'package:online_store/widget/custom_card.dart';

import '../services/cartService.dart';
import 'cart_page.dart';

class HomePage extends StatelessWidget {
  static String id = 'HomePage';

  Widget  build(BuildContext context) {
  return Scaffold(
    appBar: AppBar(
     /* actions: [
      IconButton(onPressed: (){}, icon:
     Icon(FontAwesomeIcons.cartPlus,color: Colors.black,)),
      ],
      backgroundColor: Colors.white,
      centerTitle:true ,
      title: Text('New Trend',style: TextStyle(color: Colors.black),),*/

// في home_page.dart

          actions: [
            IconButton(
              onPressed: () {
                Navigator.pushNamed(context, CartPage.id);
              },
              icon: Icon(Icons.shopping_cart, color: Colors.black),
            ),
          ],
          backgroundColor: Colors.white,
          centerTitle: true,
          title: Text('New Trend', style: TextStyle(color: Colors.black)),



  ),body:Padding(padding: EdgeInsets.only(left: 16,right: 16,top: 65 ),
 child: FutureBuilder<List<ProductModel>>(
   future: AllProductService().getAllProduct(),
     builder: (context,snapshot){

     if(snapshot.hasData ) {
       List<ProductModel> products=snapshot.data!;
       return GridView.builder(
         itemCount: products.length,
           clipBehavior: Clip.none,
           gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
               crossAxisCount: 2,
               childAspectRatio: 1.3,
               crossAxisSpacing: 10,
               mainAxisExtent: 190,

           )
           , itemBuilder: (context, index) {
         return CustomCard(product: products[index],);
       });
     }
     else{
     return  Center(
         child: CircularProgressIndicator(),
       );
     }

     },
  )

  ) );









  }

  }
