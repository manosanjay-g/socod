import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:socod/providers/auth_provider.dart';

class OTPField extends StatefulWidget {
  const OTPField({
    super.key,
  });

  @override
  State<OTPField> createState() => _OTPFieldState();
}

class _OTPFieldState extends State<OTPField> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Center(
          child: Text(
            "An OTP has been sent to your mail",
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        Consumer<AuthProvider>(
          builder: (context, authProvider, _) => TextField(
            controller: authProvider.otpController,
            keyboardType: TextInputType.number,
            cursorColor: Colors.white,
            decoration: const InputDecoration(
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: Colors.white,
                ),
              ),
              hintText: "Enter the OTP",
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
