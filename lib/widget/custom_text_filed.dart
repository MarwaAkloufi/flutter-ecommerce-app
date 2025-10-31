import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  CustomTextField({this.hinText,this.inputType,this.onChanged,this.obscureText=false});
  Function(String)? onChanged;
  String? hinText;
  bool? obscureText;
  TextInputType? inputType;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: obscureText!,
      keyboardType:inputType ,
      onChanged:onChanged ,
      decoration: InputDecoration(
        hintText:hinText,
        hintStyle: TextStyle(color: Colors.grey),
        enabledBorder: OutlineInputBorder(
          borderRadius:BorderRadius.circular(8) ,
            borderSide: BorderSide(
       color: Colors.grey
            )

        ),
        border: OutlineInputBorder(
            borderSide: BorderSide(),
          borderRadius:BorderRadius.circular(8) ,

        ),
      ),
    );
  }
}

