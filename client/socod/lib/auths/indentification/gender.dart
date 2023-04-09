import 'package:flutter/material.dart';

import '../../consts/containerconsts.dart';


class Gender extends StatefulWidget {
  const Gender({Key? key}) : super(key: key);

  @override
  State<Gender> createState() => _GenderState();
}

class _GenderState extends State<Gender> {
  bool isSelected = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        padding: EdgeInsets.symmetric(horizontal: 30),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text("YOUR", style: TextStyle(
              fontWeight: FontWeight.bold,fontSize:30),),

            GestureDetector(
              onTap: (){
                setState(() {
                  isSelected = !isSelected;
                });
              },
              child: genderIndentification(context, isSelected, "MAN")
            ),
            GestureDetector(
                onTap: (){
                  setState(() {
                    isSelected = !isSelected;
                  });
                },
                child: genderIndentification(context, isSelected, "WOMAN")
            ),
            GestureDetector(
                onTap: (){
                  setState(() {
                    isSelected = !isSelected;
                  });
                },
                child: genderIndentification(context, isSelected, "OTHERS")
            ),
          ],
        ),
      ),
    );
  }
}
