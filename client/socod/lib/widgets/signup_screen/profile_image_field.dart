import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'dart:async';

class ProfileImageField extends StatefulWidget {
  const ProfileImageField({super.key});

  @override
  State<ProfileImageField> createState() => _ProfileImageFieldState();
}

class _ProfileImageFieldState extends State<ProfileImageField> {
  XFile? image;
  final ImagePicker picker = ImagePicker();

  Future uploadImage(ImageSource media) async {
    var img = await picker.pickImage(source: media);
    setState(() {
      image = img;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        image != null
            ? const Text(
                "Preview",
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              )
            : const Text(
                "Upload your Image",
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              ),
        const SizedBox(
          height: 10,
        ),
        image == null
            ? IconButton(
                icon: const Icon(Icons.cloud_upload_rounded, size: 40),
                onPressed: () => {uploadImage(ImageSource.gallery)},
              )
            : Container(),
        const SizedBox(
          height: 20,
        ),
        Container(
          child: image != null
              ? SizedBox(
                  width: MediaQuery.of(context).size.width,
                  child: Stack(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(8),
                        child: Image.file(
                          File(image!.path),
                          fit: BoxFit.cover,
                          width: MediaQuery.of(context).size.width,
                        ),
                      ),
                      Positioned(
                        top: 30,
                        left: 20,
                        child: IconButton(
                          icon: ClipRRect(
                            borderRadius: BorderRadius.circular(50),
                            child: Container(
                              color: Colors.black26,
                              padding: const EdgeInsets.all(2),
                              child: const Icon(
                                Icons.close_rounded,
                                size: 20,
                              ),
                            ),
                          ),
                          onPressed: () => {
                            setState(
                              () => {image = null},
                            ),
                          },
                        ),
                      ),
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
                )
              : null,
        ),
        const SizedBox(
          height: 20,
        ),
      ],
    );
  }
}
