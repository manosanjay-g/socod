import 'package:flutter/material.dart';

class UserCard extends StatelessWidget {
  const UserCard({
    super.key,
    required this.imageURL,
  });
  final String imageURL;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      child: Stack(
        children: [
          Container(
              decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(7),
            image: DecorationImage(
              fit: BoxFit.cover,
              image: NetworkImage(imageURL),
            ),
          )),
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(7),
              gradient: const LinearGradient(
                colors: [
                  Color.fromARGB(200, 0, 0, 0),
                  Color.fromARGB(0, 0, 0, 0),
                ],
                begin: Alignment.bottomCenter,
                end: Alignment.center,
              ),
            ),
          ),
          Positioned(
            bottom: 30,
            left: 20,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Text(
                  "Aparna , 27",
                  style: TextStyle(
                    fontSize: 36,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(
                  height: 6,
                ),
                Text(
                  "3rd year , CSE",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
