abstract class NewsStates{}

class NewInitialState extends NewsStates{}

class NewBottomNavState extends NewsStates{}

class NewsGetBusinessLoadingState extends NewsStates{}

class NewsGetBusinessSuccessState extends NewsStates{}

class NewsGetBusinessErrorState extends NewsStates{
  final String error;

  NewsGetBusinessErrorState({required this.error});
}

class NewsGetSportsLoadingState extends NewsStates{}

class NewsGetSportsSuccessState extends NewsStates{}

class NewsGetSportsErrorState extends NewsStates{
  final String error;

  NewsGetSportsErrorState({required this.error});
}

class NewsGetScienceLoadingState extends NewsStates{}

class NewsGetScienceSuccessState extends NewsStates{}

class NewsGetScienceErrorState extends NewsStates{
  final String error;

  NewsGetScienceErrorState({required this.error});
}


class NewsGetSearchLoadingState extends NewsStates{}

class NewsGetSearchSuccessState extends NewsStates{}

class NewsGetSearchErrorState extends NewsStates{
  final String error;

  NewsGetSearchErrorState({required this.error});
}