
import '../helper/api.dart';

class AllCategories{
 Future<List>  getAllCategories() async {
   List<dynamic> data=await  Api().get(url: 'https://fakestoreapi.com/products/categories');

     return data;
   }



}