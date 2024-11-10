import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';

import 'package:news_app_api/core/utils/colors.dart';
import 'package:news_app_api/core/utils/text_style.dart';
import 'package:news_app_api/features/manager/news_cubit.dart';
import 'package:news_app_api/features/search/presentation/views/widgets/news_search_list.dart';

class SearchView extends StatelessWidget {
  SearchView({super.key});

  var searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Search for News'),
        ),
        body: Padding(
          padding: const EdgeInsets.all(15),
          child: Column(
            children: [
              Row(
                children: [
                  Expanded(
                    child: TextFormField(
                      style: getBodyStyle(),
                      controller: searchController,
                      decoration: const InputDecoration(
                        hintText: 'Search for news',
                      ),
                    ),
                  ),
                  const Gap(10),
                  SizedBox(
                    height: 50,
                    width: 50,
                    child: FloatingActionButton(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)),
                        backgroundColor: AppColors.primary,
                        child: SvgPicture.asset('assets/search.svg'),
                        onPressed: () {
                          context
                              .read<NewsCubit>()
                              .getNewsBySearch(searchController.text);
                        }),
                  )
                ],
              ),
              const Gap(20),
              const Expanded(child: NewsSearchListBuilder())
            ],
          ),
        ),
      ),
    );
  }
}
