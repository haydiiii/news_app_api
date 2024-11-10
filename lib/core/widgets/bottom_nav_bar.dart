import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:news_app_api/core/utils/colors.dart';
import 'package:news_app_api/features/home/presentation/views/home_view.dart';
import 'package:news_app_api/features/profile/presentation/views/profile_view.dart';
import 'package:news_app_api/features/search/presentation/views/search_view.dart';

class BottomNavBar extends StatefulWidget {
  const BottomNavBar({super.key});

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  int index = 0;
  List<Widget> pages = [HomeView(), SearchView(), ProfileView()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: pages[index],
        bottomNavigationBar: BottomNavigationBar(
            showUnselectedLabels: false,
            showSelectedLabels: false,
            selectedItemColor: AppColors.primary,
            unselectedItemColor: AppColors.grey,
            backgroundColor: AppColors.background,
            currentIndex: index,
            onTap: (value) => setState(() => index = value),
            items: [
              BottomNavigationBarItem(
                icon: SvgPicture.asset(
                  'assets/home.svg',
                ),
                activeIcon: SvgPicture.asset(
                  'assets/home.svg',
                  colorFilter:
                      ColorFilter.mode(AppColors.primary, BlendMode.srcIn),
                ),
                label: 'Home',
              ),
              BottomNavigationBarItem(
                  activeIcon: SvgPicture.asset(
                    'assets/search.svg',
                    colorFilter:
                        ColorFilter.mode(AppColors.primary, BlendMode.srcIn),
                  ),
                  icon: SvgPicture.asset('assets/search.svg'),
                  label: 'Search'),
              BottomNavigationBarItem(
                  activeIcon: SvgPicture.asset(
                    'assets/profile.svg',
                    colorFilter:
                        ColorFilter.mode(AppColors.primary, BlendMode.srcIn),
                  ),
                  icon: SvgPicture.asset('assets/profile.svg'),
                  label: 'Profile'),
            ]));
  }
}
