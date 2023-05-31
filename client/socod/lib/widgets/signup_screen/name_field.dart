import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:socod/providers/auth_provider.dart';

class NameField extends StatefulWidget {
  final bool isfilled;
  const NameField({super.key, required this.isfilled});

  @override
  State<NameField> createState() => _NameFieldState();
}

class _NameFieldState extends State<NameField> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Center(
          child: Text(
            "What's your Name?",
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
          builder: (context, authProvider, _) => TextField(
            controller: authProvider.nameController,
            cursorColor: Colors.white,
            decoration:  InputDecoration(
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color:widget.isfilled?Colors.white:Colors.red,
                ),
              ),
              hintText: "Enter your name",
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
