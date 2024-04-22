import 'package:bloc/bloc.dart';
import 'package:bmi_calculator/layout/news_app/cubit/states.dart';

import 'package:bmi_calculator/presentation/values_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../modules/news_app/business/business_screen.dart';
import '../../../modules/news_app/science/science_screen.dart';
import '../../../modules/news_app/sports/sports_screen.dart';
import '../../../presentation/string_manager.dart';
import '../../../shared/network/remote/dio_helper.dart';

class NewsCubit extends Cubit<NewsStates> {
  NewsCubit() : super(NewBottomNavState());

  static NewsCubit get(context) => BlocProvider.of(context);

  int currentIndex = AppSize.si0;
  List<BottomNavigationBarItem> bottomItem = [
    BottomNavigationBarItem(
      icon: Icon(Icons.business),
      label: AppString.business,
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.run_circle_outlined),
      label: AppString.sports,
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.science),
      label: AppString.science,
    ),
    // BottomNavigationBarItem(
    //   icon: Icon(Icons.settings),
    //   label: AppString.settings,
    // )
  ];
  List<Widget> screen = [
    BusinessScreen(),
    SportsScreen(),
    ScienceScreen(),
  ];

  void ChangeNavBottonBar(int index) {
    currentIndex = index;
    // if(index == 1)
    //   getSports();
    // if(index == 2)
    //   getSports();

    emit(NewBottomNavState());
  }

  List<dynamic> business = [];

  void getBusniess() {
    {
      emit(NewsGetBusinessLoadingState());
      DioHelper.getData(
        url: 'v2/top-headlines',
        query: {
          'country': 'us',
          'category': 'business',
          'apiKey': 'f722f64ea76c41f3bd8eb904c9cda840'
        },
      ).then((value) {
        // print(value?.data['articles'][0]['title']);
        business = value?.data['articles'];
        print(business[0]['title']);

        emit(NewsGetBusinessSuccessState());
      }).catchError((error) {
        print(error.toString());
        emit(NewsGetBusinessErrorState(error: error.toString()));

      });
    }
  }


  List<dynamic> sports = [];

  void getSports() {
    {
      emit(NewsGetSportsLoadingState());

      // if(sports == AppSize.s0){
        DioHelper.getData(
          url: 'v2/top-headlines',
          query: {
            'country': 'us',
            'category': 'sports',
            'apiKey': 'f722f64ea76c41f3bd8eb904c9cda840'
          },
        ).then((value) {
          // print(value?.data['articles'][0]['title']);
          sports = value?.data['articles'];
          print(sports[0]['title']);

          emit(NewsGetSportsSuccessState());
        }).catchError((error) {
          print(error.toString());
          emit(NewsGetSportsErrorState(error: error.toString()));

        });
      // }else{
      //   emit(NewsGetSportsSuccessState());
      //
      // }


    }
  }

  List<dynamic> science = [];

  void getScience() {
    {
      emit(NewsGetScienceLoadingState());

      // if(science == AppSize.s0){
        DioHelper.getData(
          url: 'v2/top-headlines',
          query: {
            'country': 'us',
            'category': 'science',
            'apiKey': 'f722f64ea76c41f3bd8eb904c9cda840'
          },
        ).then((value) {
          // print(value?.data['articles'][0]['title']);
          science = value?.data['articles'];
          print(science[0]['title']);

          emit(NewsGetScienceSuccessState());
        }).catchError((error) {
          print(error.toString());
          emit(NewsGetScienceErrorState(error: error.toString()));

        });
      // }else{
      //   emit(NewsGetScienceSuccessState());
      //
      // }


    }
  }

  List<dynamic> search = [];

  void getSearch(String value) {
    {
      emit(NewsGetSearchLoadingState());
      search =[];

      DioHelper.getData(
        url: 'v2/everything',
        query: {
          'q': '$value',
          'apiKey': 'f722f64ea76c41f3bd8eb904c9cda840'
        },
      ).then((value) {
        // print(value?.data['articles'][0]['title']);
        search = value?.data['articles'];
        print(search[0]['title']);

        emit(NewsGetSearchSuccessState());
      }).catchError((error) {
        print(error.toString());
        emit(NewsGetSearchErrorState(error: error.toString()));

      });

    }
  }



}
