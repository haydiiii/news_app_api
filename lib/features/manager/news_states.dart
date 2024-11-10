import 'package:news_app_api/features/model/news_model.dart';

class NewsStates {}

class NewsInitialState extends NewsStates {}

// get news by category
class NewsByCategoryLoadingState extends NewsStates {}

class NewsByCategorySuccessState extends NewsStates {
  final NewsModel model;

  NewsByCategorySuccessState(this.model);
}

class NewsByCategoryErrorState extends NewsStates {}

// for search

class NewsBySearchLoadingState extends NewsStates {}

class NewsBySearchSuccessState extends NewsStates {
  final NewsModel model;

  NewsBySearchSuccessState(this.model);
}

class NewsBySearchErrorState extends NewsStates {}

// get news by source
class NewsBySourceLoadingState extends NewsStates {}

class NewsBySourceSuccessState extends NewsStates {
  final NewsModel model;

  NewsBySourceSuccessState(this.model);
}

class NewsBySourceErrorState extends NewsStates {}