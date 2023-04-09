import 'package:flutter/material.dart';
import 'package:socod/auths/indentification/sexuality.dart';
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
  bool isOthersSelected = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: nextbtn(context, MaterialPageRoute(builder: (context)=>Sexuality())),
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
                    isOthersSelected = false;
                  });
                },
                child: genderIndentification(context, isMaleSelected, "MAN")),
            GestureDetector(
                onTap: () {
                  setState(() {
                    isMaleSelected = false;
                    isFemaleSelected = !isFemaleSelected;
                    isOthersSelected = false;
                  });
                },
                child:
                    genderIndentification(context, isFemaleSelected, "WOMAN")),
            GestureDetector(
                onTap: () {
                  setState(() {
                    isMaleSelected = false;
                    isFemaleSelected = false;
                    isOthersSelected = !isOthersSelected;
                  });
                },
                child:
                    genderIndentification(context, isOthersSelected, "OTHERS")),
          ],
        ),
      ),
    );
  }
}
