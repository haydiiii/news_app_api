

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app_api/core/services/appi_services.dart';
import 'package:news_app_api/features/manager/news_states.dart';

class NewsCubit extends Cubit<NewsStates> {
  NewsCubit() : super(NewsInitialState());

  getNewsByCategory(String category) {
    emit(NewsByCategoryLoadingState());
    try {
      ApiServices.getNewsByCategory(category).then((value) {
        emit(NewsByCategorySuccessState(value!));
      });
    } catch (e) {
      emit(NewsByCategoryErrorState());
    }
  }

  getNewsBySearch(String query) {
    emit(NewsBySearchLoadingState());
    try {
      ApiServices.getNewsBySearch(query).then((value) {
        emit(NewsBySearchSuccessState(value!));
      });
    } catch (e) {
      emit(NewsBySearchErrorState());
    }
  }

  getNewsBySource(String source) {
    emit(NewsBySourceLoadingState());
    try {
      ApiServices.getNewsBySource(source).then((value) {
        emit(NewsBySourceSuccessState(value!));
      });
    } catch (e) {
      emit(NewsBySourceErrorState());
    }
  }
}