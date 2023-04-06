import "package:flutter/material.dart";
import "package:socod/auths/dobpage.dart";

import "../consts/textFields.dart";

class CreateAccount extends StatefulWidget {
  const CreateAccount({Key? key}) : super(key: key);

  @override
  State<CreateAccount> createState() => _CreateAccountState();
}

class _CreateAccountState extends State<CreateAccount> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton.extended(onPressed: (){
        Navigator.push(context, MaterialPageRoute(builder: (context)=>DOB()));
      }, 
        label: Text("Next"), 
        icon: Icon(Icons.chevron_right),),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,

          children: [
            TextFormField(
              decoration: InputDecoration(
                  hintText: "Name",
                  hintStyle: Textfields.texthintsytle,
                  border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20)
                )
              ),
            ),
           const SizedBox(height: 5,),
            TextFormField(
              decoration: InputDecoration(
                hintText: "Email",
                  hintStyle: Textfields.texthintsytle,

                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20)
                  )
              ),
            ),
            const SizedBox(height: 5,),
            TextFormField(
              decoration: InputDecoration(
                  hintText: "Password",
                  hintStyle: Textfields.texthintsytle,

                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20)
                  )
              ),
            ),
          ],
        ),
      ),
    );
  }
}
