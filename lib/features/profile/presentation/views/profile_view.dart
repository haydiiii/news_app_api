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

class ProfileView extends StatefulWidget {
  const ProfileView({super.key});

  @override
  State<ProfileView> createState() => _ProfileViewState();
}

class _ProfileViewState extends State<ProfileView> {
  String path = AppLocalStorage.getData('image');

  var nameController = TextEditingController();
  var formKey = GlobalKey<FormState>();
  uploadImage({required bool isCamera}) async {
    final pickedImage = await ImagePicker()
        .pickImage(source: isCamera ? ImageSource.camera : ImageSource.gallery);
    if (pickedImage != null) {
      AppLocalStorage.cashData(
        'image',
        pickedImage.path,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        foregroundColor: AppColors.primary,
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.sunny),
          ),
        ],
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios,
            color: AppColors.primary,
          ),
          onPressed: () {
            pushWithReplacement(context, BottomNavBar());
          },
        ),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Stack(
                alignment: Alignment.bottomRight,
                children: [
                  CircleAvatar(
                    radius: 60,
                    backgroundImage: (path.isNotEmpty)
                        ? FileImage(File(path)) as ImageProvider
                        : AssetImage(ImagesAssets.user),
                  ),
                  CircleAvatar(
                    child: IconButton(
                      onPressed: () {
                        showModalBottomSheet(
                          context: context,
                          builder: (context) {
                            return SafeArea(
                              child: Container(
                                  margin: EdgeInsets.all(10),
                                  height: 100,
                                  width: double.infinity,
                                  child: Column(children: [
                                    CustomButton(
                                      width: double.infinity,
                                      height: 40,
                                      textColor: AppColors.white,
                                      color: AppColors.primary,
                                      onPressed: () async {
                                        uploadImage(isCamera: true);
                                        setState(() {
                                          path =
                                              AppLocalStorage.getData('image');
                                        });

                                        Navigator.pop(context);
                                      },
                                      text: 'Upload from Camera',
                                    ),
                                    Gap(5),
                                    CustomButton(
                                      width: double.infinity,
                                      height: 40,
                                      textColor: AppColors.white,
                                      color: AppColors.primary,
                                      onPressed: () async {
                                        uploadImage(isCamera: false);
                                        setState(() {
                                          path =
                                              AppLocalStorage.getData('image');
                                        });
                                        Navigator.pop(context);
                                      },
                                      text: 'Upload from Gallery  ',
                                    ),
                                  ])),
                            );
                          },
                        );
                      },
                      icon: Icon(Icons.camera_alt),
                    ),
                  ),
                ],
              ),
              Gap(20),
              Divider(),
              Gap(20),
              Row(
                children: [
                  Text(
                    AppLocalStorage.getData('name'),
                    style: getTitleStyle(color: AppColors.primary),
                  ),
                  Spacer(),
                  CircleAvatar(
                    radius: 20,
                    backgroundColor: AppColors.primary,
                    child: CircleAvatar(
                      backgroundColor: AppColors.white,
                      radius: 19,
                      child: IconButton(
                        onPressed: () {
                          nameController.text = AppLocalStorage.getData('name');
                          showModalBottomSheet(
                            context: context,
                            builder: (context) {
                              return Form(
                                key: formKey,
                                child: SafeArea(
                                  child: Container(
                                      margin: EdgeInsets.all(10),
                                      height: 100,
                                      width: double.infinity,
                                      child: Column(children: [
                                        TextFormField(
                                            controller: nameController,
                                            validator: (value) {
                                              if (value!.isEmpty) {
                                                return 'Please Enter Your Name';
                                              } else {
                                                return null;
                                              }
                                            }),
                                        Gap(5),
                                        CustomButton(
                                          width: double.infinity,
                                          height: 40,
                                          textColor: AppColors.white,
                                          color: AppColors.primary,
                                          onPressed: () async {
                                            if (formKey.currentState!
                                                .validate()) {
                                              AppLocalStorage.cashData(
                                                  'name', nameController.text);
                                              setState(() {
                                                nameController.text =
                                                    AppLocalStorage.getData(
                                                        'name');
                                              });
                                              Navigator.pop(context);
                                            }
                                          },
                                          text: 'Upload Your Name ',
                                        ),
                                      ])),
                                ),
                              );
                            },
                          );
                        },
                        icon: Icon(
                          Icons.edit,
                          color: AppColors.primary,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

//////////////showImageSourceOptions////////////////////////
