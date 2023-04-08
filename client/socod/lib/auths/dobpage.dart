import 'package:flutter/material.dart';

import 'package:dob_input_field/dob_input_field.dart';
import 'package:socod/auths/imterests.dart';
import 'package:socod/consts/nextbtn.dart';


extension IsAtLeastYearsOld on DateTime {
  bool isAtLeastYearsOld(int years) {
    var now = DateTime.now();
    var boundaryDate = DateTime(now.year - years, now.month, now.day);

    var thisDate = DateTime(year, month, day);

    return thisDate.compareTo(boundaryDate) <= 0;
  }
}

class DOB extends StatefulWidget {
  const DOB({Key? key}) : super(key: key);

  @override
  State<DOB> createState() => _DOBState();
}

class _DOBState extends State<DOB> {


  @override
  Widget build(BuildContext context) {
    print(DateTime(2002, 8, 21).isAtLeastYearsOld(18)); // Prints: false
    return Scaffold(
      floatingActionButton: nextbtn(context, MaterialPageRoute(builder: (context)=>Interests())),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Row(
          children: [
            Container(
              margin: EdgeInsets.fromLTRB(5, 0, 5, 0),
              height: 50,
              width: 50,
              child: TextFormField(
                textAlign: TextAlign.center,
                decoration: InputDecoration(
                  hintText: 'DD',
                  border: OutlineInputBorder()
                ),
              ),
            ),
            Container(
              height: 50,
              width: 70,
              child: TextFormField(
                textAlign: TextAlign.center,
                decoration: InputDecoration(
                    hintText: 'MM',
                    border: OutlineInputBorder()
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.fromLTRB(5, 0, 5, 0),
              height: 50,
              width: 100,
              child: TextFormField(
                textAlign: TextAlign.center,
                decoration: InputDecoration(
                    hintText: 'YYYY',
                    border: OutlineInputBorder()
                ),
              ),
            ),
          ],
        )
      ),
    );
  }
}
