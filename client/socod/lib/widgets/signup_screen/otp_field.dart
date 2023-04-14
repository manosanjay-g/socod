import 'package:flutter/material.dart';

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
      children: const [
        Center(
          child: Text(
            "An OTP has been sent to your mail",
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        SizedBox(
          height: 20,
        ),
        TextField(
          keyboardType: TextInputType.number,
          cursorColor: Colors.white,
          decoration: InputDecoration(
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: Colors.white,
              ),
            ),
            hintText: "Enter the OTP",
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
