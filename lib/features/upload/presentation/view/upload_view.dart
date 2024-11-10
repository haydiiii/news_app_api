import 'dart:io';

import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:image_picker/image_picker.dart';
import 'package:news_app_api/core/constants/iamge_assets.dart';
import 'package:news_app_api/core/functions/routing.dart';
import 'package:news_app_api/core/services/local_storage.dart';
import 'package:news_app_api/core/utils/colors.dart';
import 'package:news_app_api/core/utils/text_style.dart';
import 'package:news_app_api/core/widgets/bottom_nav_bar.dart';
import 'package:news_app_api/core/widgets/custom_button.dart';
import 'package:news_app_api/core/widgets/snackbar_dialog.dart';

class UploadView extends StatefulWidget {
  const UploadView({super.key});

  @override
  State<UploadView> createState() => _UploadViewState();
}

class _UploadViewState extends State<UploadView> {
  final TextEditingController nameController = TextEditingController();
  String? path;
  

  @override
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          TextButton(
            onPressed: () {

              if (path != null && nameController.text.isNotEmpty) {
                AppLocalStorage.cashData('name', nameController.text);
                AppLocalStorage.cashData('image', path);
                AppLocalStorage.cashData('isLogin', true);
                pushWithReplacement(context, BottomNavBar());
              } else if (path == null && nameController.text.isEmpty) {
                showSnackbarDialog(
                  context: context,
                  message: 'Please enter your name and upload your image',
                );
              } else if (path == null) {
                showSnackbarDialog(
                  context: context,
                  message: 'Please upload your image',
                );
              } else {
                showSnackbarDialog(
                  context: context,
                  message: 'Please enter your name',
                );
              }
            },
            child: Text(
              "Done",
              style: getBodyStyle(color: AppColors.primary),
            ),
          )
        ],
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(25),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircleAvatar(
                radius: 60,
                backgroundImage: (path != null)
                    ? FileImage(File(path!)) as ImageProvider
                    : AssetImage(ImagesAssets.user),
              ),
              const Gap(10),
              CustomButton(
                textColor: AppColors.white,
                color: AppColors.cardColor,
                onPressed: () async {
                  uploadImage(true);
                },
                text: 'Upload from Camera',
              ),
              const Gap(5),
              CustomButton(
                textColor: AppColors.white,
                color: AppColors.cardColor,
                onPressed: () async {
                  uploadImage(false);
                },
                text: 'Upload from Gallery',
              ),
              const Gap(5),
              const Divider(),
              const Gap(10),
              TextFormField(
                controller: nameController,
                decoration: const InputDecoration(hintText: 'Enter Your Name'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> uploadImage(bool isCamera) async {
    final pickedImage = await ImagePicker().pickImage(
      source: isCamera ? ImageSource.camera : ImageSource.gallery,
    );
    if (pickedImage != null) {
      setState(() {
        path = pickedImage.path;
      });
    }
  }
}
