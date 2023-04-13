import 'package:flutter/material.dart';
import 'package:socod/widgets/matches_screen/chat_box.dart';

class MatchesScreen extends StatelessWidget {
  const MatchesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: const [
          Text(
            "Matches",
            style: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.w600,
            ),
          ),
          ChatBox(),
          ChatBox(),
          ChatBox(),
          ChatBox(),
        ],
      ),
    );
  }
}
