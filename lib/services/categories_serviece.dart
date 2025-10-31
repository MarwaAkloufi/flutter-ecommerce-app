import 'package:online_store/models/product_model.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

import '../helper/api.dart';
class CategoriesService{
  Future<List<ProductModel>> getCategoriesProducts({required String category_name})async {

    List<dynamic> data=await  Api().get(url: 'https://fakestoreapi.com/products/category/$category_name');

      List<ProductModel> productList = [];
      for (int i = 0; i < data.length; i++) {
        productList.add(ProductModel.fromJson(data[i]));
      }
      return productList;
    }


  }




