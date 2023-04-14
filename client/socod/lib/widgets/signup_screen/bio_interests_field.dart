import 'package:flutter/material.dart';

class BioInterestsField extends StatelessWidget {
  const BioInterestsField({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: const [
        Text(
          "About you",
          style: TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(
          height: 20,
        ),
        TextField(
          maxLines: 8,
          cursorColor: Colors.white,
          decoration: InputDecoration(
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: Colors.white,
              ),
            ),
            hintText: "Enter your bio",
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
