import 'package:flutter/material.dart';

class DeptField extends StatelessWidget {
  DeptField({super.key});
  final _depts = ["CSE", "AIML", "BT", "BME"];
  final _years = ["1st", "2nd", "3rd", "4th", "5th"];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Text(
          "What's your Department and Year?",
          style: TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        DropdownButton<String>(
          isExpanded: true,
          hint: const Text("Select your Department"),
          borderRadius: BorderRadius.circular(7),
          items: _depts.map((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Text(value),
            );
          }).toList(),
          onChanged: (_) {},
        ),
        const SizedBox(
          height: 20,
        ),
        DropdownButton<String>(
          isExpanded: true,
          hint: const Text("Year of study"),
          borderRadius: BorderRadius.circular(7),
          items: _years.map((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Text(value),
            );
          }).toList(),
          onChanged: (_) {},
        ),
        const SizedBox(
          height: 20,
        ),
      ],
    );
  }
}
