import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:online_store/models/product_model.dart';

import '../helper/api.dart';
class AllProductService {

  Future<List<ProductModel>> getAllProduct() async {
    print('getAllProduct called');
    try{
 List<dynamic> data=await  Api().get(url: 'https://fakestoreapi.com/products');

print('Data received ${data.length} items');
      List<ProductModel> productList = [];
      for (int i = 0; i < data.length; i++) {

        productList.add(ProductModel.fromJson(data[i]));

      }
      return productList;
    }
    catch(e){
      print('error in getAllProduct:$e');
      return [];
    }


}}