
import 'package:flutter/material.dart';

Widget genderIndentification(context, bool isSelected, String str){
  return Container(
    height: 60,
    alignment: Alignment.center,
    margin: EdgeInsets.symmetric(vertical: 7),
    width: MediaQuery.of(context).size.width,
    decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(40),
        border: Border.all(
            width: 4,
            color:isSelected? Colors.purple:Colors.grey)
    ),
    child: Text(str, style: TextStyle(fontSize: 20, color:isSelected? Colors.purple:Colors.grey,fontWeight: FontWeight.bold),),
  );
}