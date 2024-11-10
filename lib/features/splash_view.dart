import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:news_app_api/core/constants/iamge_assets.dart';
import 'package:news_app_api/core/functions/routing.dart';
import 'package:news_app_api/core/services/local_storage.dart';
import 'package:news_app_api/core/utils/text_style.dart';
import 'package:news_app_api/core/widgets/bottom_nav_bar.dart';
import 'package:news_app_api/features/upload/presentation/view/upload_view.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  bool isLogin = AppLocalStorage.getData('isLogin')??false;
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 3), () {
      pushWithReplacement(context, isLogin? BottomNavBar() : UploadView());
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(ImagesAssets.logoApp

                // width: 200,
                // height: 200,
                ),
            Text(
              'Insights News',
              style: getTitleStyle(),
            ),
            Gap(10),
            Text(
              "Stay Informed, Anytime, Anywhere.",
              style: getBodyStyle(),
            ),
          ],
        ),
      ),
    );
  }
}
