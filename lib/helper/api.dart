import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
class Api {
  Future<dynamic> get({required String url, @required String? token}) async {
    Map<String, String> headers = {};
    if (token != null) {
      headers.addAll({
        'Authorization': 'Bearer $token',

      });
    }
    try {
      print('Get Request to $url');

    http.Response response = await http.get(Uri.parse(url), headers: headers);
    print('Response status ${response.statusCode}');
    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    }
    else {
      throw Exception('there is problem  with status ${response.statusCode}');
    }
  }
  catch (e){
      print('Api Error $e');
  }

  }



Future<dynamic> post({required dynamic url,@required dynamic body,@required String? token }) async {
  Map<String, String> headers = {};
  if (token != null) {
    headers.addAll({
      'Authorization': 'Bearer $token',

    });
  }
  try {
    print('post Request to $url');
  http.Response response = await http.post(Uri.parse(url),
      body: body,
      headers: headers
  );
    print('Response status ${response.statusCode}');

  if (response.statusCode ==200) {
    return jsonDecode(response.body);
  }
  else{
    throw Exception('there is problem  with status ${response.statusCode} with body ${jsonDecode(response.body)}');

  }
  }
  catch (e){
    print('Api Error $e');
  }

}


 Future<dynamic> put({required dynamic url,@required dynamic body,@required String? token }) async {
   Map<String, String> headers = {};
   headers.addAll({
     'Content-Type': 'application/x-www-form-urlencoded',


       });

   if (token != null) {
     headers.addAll({
       'Authorization': 'Bearer $token',

     });
   }

   try {
     print('put Request to $url');
   http.Response response = await http.put(Uri.parse(url),
       body: body,
       headers: headers
   );
     print('Response status ${response.statusCode}');

   if (response.statusCode ==200) {
     return jsonDecode(response.body);
   }
   else{
     throw Exception('there is problem  with status ${response.statusCode} with body ${jsonDecode(response.body)}');

   }
 }
  catch (e){
  print('Api Error $e');
  }

}}