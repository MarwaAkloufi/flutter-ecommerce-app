import 'package:flutter/material.dart';
class CustomButon extends StatelessWidget {
  CustomButon({required this.text,required  this.onTap});
  VoidCallback? onTap;
  String text;
  @override
  Widget build(BuildContext context) {
    return
      GestureDetector(
          onTap:onTap ,
          child:  Container(
            decoration: BoxDecoration(
                color: Colors.blue,
                borderRadius: BorderRadius.circular(8)
            ),
            child:Center(
                child: Text(text,style: TextStyle(color: Colors.white),)),
            height: 60,
            width: double.infinity,
          )) ;
  }


}
