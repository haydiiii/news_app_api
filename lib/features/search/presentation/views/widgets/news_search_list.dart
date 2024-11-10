import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';

import 'package:news_app_api/core/utils/colors.dart';
import 'package:news_app_api/core/utils/text_style.dart';
import 'package:news_app_api/features/manager/news_cubit.dart';
import 'package:news_app_api/features/manager/news_states.dart';

class NewsSearchListBuilder extends StatelessWidget {
  const NewsSearchListBuilder({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NewsCubit, NewsStates>(
      builder: (context, state) {
        if (state is NewsBySearchSuccessState) {
          var news = state.model.articles;
          return ListView.builder(
            itemCount: news?.length,
            itemBuilder: (BuildContext context, int index) {
              return InkWell(
                onTap: () async {
            //      navigateTo(context, NewsDetailsView(model: news![index]));
                },
                child: Container(
                  height: 100,
                  margin: const EdgeInsets.only(top: 10),
                  decoration: BoxDecoration(
                      color: AppColors.cardColor,
                      borderRadius: BorderRadius.circular(10)),
                  child: Row(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Image.network(
                          news?[index].urlToImage ?? '',
                          fit: BoxFit.cover,
                          height: 100,
                          width: 150,
                          errorBuilder: (context, error, stackTrace) {
                            return SizedBox(
                                width: 150,
                                height: 100,
                                child: Icon(
                                  Icons.error,
                                  color: AppColors.grey,
                                ));
                          },
                        ),
                      ),
                      const Gap(10),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Text(
                              news?[index].title ?? '',
                              maxLines: 3,
                              overflow: TextOverflow.ellipsis,
                              style: getTitleStyle(),
                            ),
                            Row(
                              children: [
                                Icon(
                                  Icons.menu,
                                  color: AppColors.white,
                                  size: 14,
                                ),
                                const Gap(5),
                                Text(
                                  'Read',
                                  style: getSmallStyle(
                                      color: AppColors.white),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          );
        } else if (state is NewsBySearchErrorState) {
          return const Center(
            child: Text('An error occurred!'),
          );
        } else {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SvgPicture.asset(
                  'assets/search.svg',
                  width: 120,
                ),
                const Gap(20),
                Text(
                  'Search for news',
                  style: getBodyStyle(),
                )
              ],
            ),
          );
        }
      },
    );
  }
}