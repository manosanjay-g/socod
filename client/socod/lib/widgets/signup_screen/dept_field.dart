import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:socod/providers/auth_provider.dart';

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
        Consumer<AuthProvider>(
          builder: (context, authProvider, _) => DropdownButton<String>(
            isExpanded: true,
            value: authProvider.deptController,
            hint: const Text("Select your Department"),
            borderRadius: BorderRadius.circular(7),
            items: _depts.map((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(value),
              );
            }).toList(),
            onChanged: (String? newValue) {
              authProvider.setDept(newValue);
            },
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        Consumer<AuthProvider>(
          builder: (context, authProvider, _) => DropdownButton<String>(
            isExpanded: true,
            value: authProvider.yearController,
            hint: const Text("Year of study"),
            borderRadius: BorderRadius.circular(7),
            items: _years.map((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(value),
              );
            }).toList(),
            onChanged: (String? newValue) {
              authProvider.setYear(newValue);
            },
          ),
        ),
        const SizedBox(
          height: 20,
        ),
      ],
    );
  }
}
