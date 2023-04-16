import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'dart:async';
import 'package:provider/provider.dart';
import 'package:socod/providers/auth_provider.dart';

class ProfileImageField extends StatelessWidget {
  ProfileImageField({super.key});
  final ImagePicker picker = ImagePicker();

  Future uploadImage(ImageSource media) async {}

  @override
  Widget build(BuildContext context) {
    return Consumer<AuthProvider>(
      builder: (context, authProvider, _) => Column(
        children: [
          authProvider.image != null
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
          authProvider.image == null
              ? IconButton(
                  icon: const Icon(Icons.cloud_upload_rounded, size: 40),
                  onPressed: () async {
                    var img =
                        await picker.pickImage(source: ImageSource.camera);
                    authProvider.setImage(img);
                  },
                )
              : Container(),
          const SizedBox(
            height: 20,
          ),
          Container(
            child: authProvider.image != null
                ? SizedBox(
                    width: MediaQuery.of(context).size.width,
                    child: Stack(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(8),
                          child: Image.file(
                            File(authProvider.image!.path),
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
                              authProvider.setImage(null),
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
                            children: [
                              Text(
                                authProvider.nameController.text,
                                style: const TextStyle(
                                  fontSize: 36,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const SizedBox(
                                height: 6,
                              ),
                              Text(
                                "${authProvider.yearController} year , ${authProvider.deptController}",
                                style: const TextStyle(
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
      ),
    );
  }
}
