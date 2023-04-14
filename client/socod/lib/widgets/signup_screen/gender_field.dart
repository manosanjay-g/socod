import 'package:flutter/material.dart';

class GenderField extends StatelessWidget {
  GenderField({super.key});
  final _genders = ["Male", "Female"];
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Center(
          child: Text(
            "What's your Gender?",
            style: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        DropdownButton<String>(
          isExpanded: true,
          hint: const Text("Select your Gender"),
          borderRadius: BorderRadius.circular(7),
          items: _genders.map((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Text(value),
            );
          }).toList(),
          onChanged: (_) {},
        ),
        const SizedBox(
          height: 20,
        )
      ],
    );
  }
}
