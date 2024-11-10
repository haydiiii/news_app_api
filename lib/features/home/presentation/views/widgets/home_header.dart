import 'dart:io';

import 'package:flutter/material.dart';
import 'package:news_app_api/core/constants/iamge_assets.dart';
import 'package:news_app_api/core/functions/routing.dart';
import 'package:news_app_api/core/services/local_storage.dart';
import 'package:news_app_api/core/utils/colors.dart';
import 'package:news_app_api/core/utils/text_style.dart';
import 'package:news_app_api/features/profile/presentation/views/profile_view.dart';

class HomeHeader extends StatelessWidget {
  const HomeHeader({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    String? name = AppLocalStorage.getData('name');
    String? path = AppLocalStorage.getData('image');
    return Row(
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Hello , $name',
                style: getTitleStyle(color: AppColors.primary)),
            Text('Have a nice day', style: getBodyStyle()),
          ],
        ),
        Spacer(),
        GestureDetector(
          onTap: () {
            pushWithReplacement(context, ProfileView());
          },
          child: CircleAvatar(
            radius: 25,
            backgroundImage: (path != null)
                ? FileImage(File(path)) as ImageProvider
                : AssetImage(ImagesAssets.user),
          ),
        )
      ],
    );
  }
}
