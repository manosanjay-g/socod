import 'package:flutter/material.dart';
import 'package:socod/auths/indentification/showme.dart';
import 'package:socod/consts/nextbtn.dart';

import '../../consts/containerconsts.dart';

class Gender extends StatefulWidget {
  const Gender({Key? key}) : super(key: key);

  @override
  State<Gender> createState() => _GenderState();
}

class _GenderState extends State<Gender> {
  bool isMaleSelected = false;
  bool isFemaleSelected = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: nextbtn(context, MaterialPageRoute(builder: (context)=>ShowMe())),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        padding: EdgeInsets.symmetric(horizontal: 30),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              "YOUR",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
            ),
            GestureDetector(
                onTap: () {
                  setState(() {
                    isMaleSelected = !isMaleSelected;
                    isFemaleSelected = false;
                  });
                },
                child: genderIndentification(context, isMaleSelected, "MALE")),
            GestureDetector(
                onTap: () {
                  setState(() {
                    isMaleSelected = false;
                    isFemaleSelected = !isFemaleSelected;
                  });
                },
                child:
                    genderIndentification(context, isFemaleSelected, "WOMAN")),
          ],
        ),
      ),
    );
  }
}
