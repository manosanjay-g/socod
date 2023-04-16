import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:socod/providers/auth_provider.dart';

class BioInterestsField extends StatelessWidget {
  const BioInterestsField({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Text(
          "About you",
          style: TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        Consumer<AuthProvider>(
          builder: (context, authProvider, _) => TextField(
            controller: authProvider.bioController,
            maxLines: 8,
            cursorColor: Colors.white,
            decoration: const InputDecoration(
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: Colors.white,
                ),
              ),
              hintText: "Enter your bio",
              border: OutlineInputBorder(),
            ),
          ),
        ),
        const SizedBox(
          height: 20,
        ),
      ],
    );
  }
}
