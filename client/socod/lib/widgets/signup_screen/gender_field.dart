import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:socod/providers/auth_provider.dart';

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
        Consumer<AuthProvider>(
          builder: (context, authProvider, _) => DropdownButton<String>(
            value: authProvider.genderController,
            isExpanded: true,
            hint: const Text("Select your Gender"),
            borderRadius: BorderRadius.circular(7),
            items: _genders.map((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(value),
              );
            }).toList(),
            onChanged: (String? newValue) {
              authProvider.setGender(newValue);
            },
          ),
        ),
        const SizedBox(
          height: 20,
        )
      ],
    );
  }
}
