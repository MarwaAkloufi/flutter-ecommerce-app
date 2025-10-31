import 'package:http/http.dart';
import 'package:online_store/models/product_model.dart';

import '../helper/api.dart';
class UpdateProductService{
  Future<ProductModel> updateProduct ({
    required String title,required String price,
    required String desc,required String image,required int id,required String category}) async{

    Map<String,dynamic> data=await   Api().put(url:Uri.parse('https://fakestoreapi.com/products/$id') , body:
    {
      'title': title,
      'price': price,
      'description': desc,
      'image': image,
      'category': category
    }


    );


    return ProductModel.fromJson(data);

  }












}