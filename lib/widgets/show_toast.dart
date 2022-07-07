  import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

showInToast(BuildContext context,String value) {
  Fluttertoast.showToast(
      msg: "$value",
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.TOP,
      timeInSecForIosWeb: 1,
      backgroundColor:Colors.black54,
      textColor: Colors.white,
      fontSize: 16.0);
}

void showSnackBar(BuildContext context,String text){
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(text)));
}