import 'package:buttons_tabbar/buttons_tabbar.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:news_app_api/core/constants/iamge_assets.dart';
import 'package:news_app_api/core/utils/colors.dart';
import 'package:news_app_api/core/utils/text_style.dart';
import 'package:news_app_api/features/home/presentation/views/widgets/home_header.dart';
import 'package:news_app_api/features/home/presentation/views/widgets/list_of_news.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView>
    with SingleTickerProviderStateMixin {
  int currentindex = 0;
  late TabController tabController;

  @override
  void initState() {
    super.initState();
    tabController = TabController(length: 4, vsync: this);
  }

  @override
  void dispose() {
    tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            HomeHeader(),
            CarouselSlider.builder(
              itemCount: 6,
              itemBuilder:
                  (BuildContext context, int itemIndex, int pageViewIndex) {
                return Container(
                  decoration:
                      BoxDecoration(borderRadius: BorderRadius.circular(10)),
                  child: Image.asset(
                    ImagesAssets.carousal,
                  ),
                );
              },
              options: CarouselOptions(
                height: 160,
                aspectRatio: 16 / 9,
                viewportFraction: 0.8,
                initialPage: 0,
                enableInfiniteScroll: true,
                reverse: false,
                autoPlay: true,
                autoPlayInterval: Duration(seconds: 3),
                autoPlayAnimationDuration: Duration(milliseconds: 800),
                autoPlayCurve: Curves.fastOutSlowIn,
                enlargeCenterPage: true,
                enlargeFactor: 0.3,
                onPageChanged: (index, reason) {
                  setState(() {
                    currentindex = index;
                  });
                },
                scrollDirection: Axis.horizontal,
              ),
            ),
            Gap(5),
            SmoothPageIndicator(
              controller: PageController(initialPage: currentindex),
              count: 6,
              effect: WormEffect(
                dotColor: AppColors.grey,
                activeDotColor: AppColors.primary,
                dotHeight: 10,
                dotWidth: 10,
              ),
            ),
            Gap(15),
            ButtonsTabBar(
                controller: tabController,
                // Customize the appearance and behavior of the tab bar
                backgroundColor: AppColors.primary,
                contentPadding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                buttonMargin:
                    const EdgeInsets.symmetric(horizontal: 5, vertical: 0),
                unselectedBackgroundColor: AppColors.cardColor,
                labelStyle: getBodyStyle(color: AppColors.background),
                unselectedLabelStyle: getBodyStyle(),
                // Add your tabs here
                tabs: const [
                  Tab(text: 'Science'),
                  Tab(text: 'Entertainment'),
                  Tab(text: 'Sports'),
                  Tab(text: 'Business'),
                ]),
            Gap(10),
            Expanded(
              child: TabBarView(
                controller: tabController,
                children: [
                  Expanded(child: ListOfNews(
                    category: 'science',
                  )),
                  Expanded(child: ListOfNews(
                    category:  'Entertainment',
                  )),
                  Expanded(child: ListOfNews(category: 'Sports',)),
                  Expanded(child: ListOfNews(category: 'Business',)),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
