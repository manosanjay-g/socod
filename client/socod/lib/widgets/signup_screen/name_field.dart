import 'package:flutter/material.dart';

class NameField extends StatefulWidget {
  const NameField({
    super.key,
  });

  @override
  State<NameField> createState() => _NameFieldState();
}

class _NameFieldState extends State<NameField> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: const [
        Center(
          child: Text(
            "What's your Name?",
            style: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        SizedBox(
          height: 20,
        ),
        TextField(
          cursorColor: Colors.white,
          decoration: InputDecoration(
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: Colors.white,
              ),
            ),
            hintText: "Enter your name",
            border: OutlineInputBorder(),
          ),
        ),
        SizedBox(
          height: 20,
        ),
      ],
    );
  }
}
