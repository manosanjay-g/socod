
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Widget nextbtn(context, MaterialPageRoute materialPageRoute){
  return  FloatingActionButton.extended(onPressed: (){
    Navigator.push(context, materialPageRoute);
  },
    label: Text("Next"),
    icon: Icon(Icons.chevron_right),);
}