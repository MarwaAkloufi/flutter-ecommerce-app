import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:online_store/models/product_model.dart';
import 'package:online_store/services/update_product.dart';
import 'package:online_store/widget/custom_button.dart';
import 'package:online_store/widget/custom_text_filed.dart';

class UpdateProductPage extends StatefulWidget {

  static String id = 'UpdataProductPage';
  State<UpdateProductPage> createState()=>_UpdateProductState();
}
class _UpdateProductState extends State<UpdateProductPage>{
  String? productName,desc,image;
  String? price;
  bool isLoading=false;
  Widget build(BuildContext context) {
    ProductModel product=ModalRoute.of(context)!.settings.arguments as ProductModel;

    return ModalProgressHUD(
        inAsyncCall: isLoading,

        child: Scaffold(
      appBar: AppBar(title: Text('Update Product' ,
        style: TextStyle(color: Colors.black),),
        backgroundColor: Colors.blue,
        centerTitle: true,
        elevation: 0,
        ),
     body: Padding(padding: EdgeInsets.all(16),
     child:SingleChildScrollView(
     child: Column(
      children: [
        SizedBox(height: 100,),
        CustomTextField(
          onChanged: (data){
            productName=data;
          },
          hinText: 'Product Name' ,
        ),
       SizedBox(height: 17,)

       , CustomTextField(
          inputType: TextInputType.number,
          onChanged: (data){
            price=data;
          },
          hinText: 'Price',
        ),
        SizedBox(height: 17,)

        , CustomTextField(
          onChanged: (data){
            desc=data;
          },
          hinText: 'Description',
        ),
        SizedBox(height: 17,)

        , CustomTextField(
          hinText: 'Image',
        ),
        SizedBox(height: 27,),
       CustomButon(text: 'Update', onTap: ()async{
         isLoading=true;
         setState(() {
         });
         try {
       await  upfateProduct(product);
           print('success');
         }
         catch (e){
           print(e.toString());
         }
           isLoading=false;
           setState(() {
           });


       }),
      ],
     ),)),));}

  Future<void> upfateProduct(ProductModel product) async{
  await  UpdateProductService().updateProduct(
    id:product.id,
        title: productName==null? product.title: productName!,
        price:price==null? product.price.toString() :price!,
        desc: desc==null? product.description: desc!,
        image: image==null?product.image:image!,
        category:product.category );
  }








}
