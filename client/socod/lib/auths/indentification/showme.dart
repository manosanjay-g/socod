import 'package:flutter/material.dart';

import '../../consts/containerconsts.dart';
import '../../consts/nextbtn.dart';

class ShowMe extends StatefulWidget {
  const ShowMe({Key? key}) : super(key: key);

  @override
  State<ShowMe> createState() => _ShowMeState();
}

class _ShowMeState extends State<ShowMe> {
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
              "SHOW ME",
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
                child: genderIndentification(context, isFemaleSelected, "FEMALE"))
          ],
        ),
      ),
    );
  }
}
