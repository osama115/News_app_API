import 'package:bloc/bloc.dart';
import 'package:bmi_calculator/model/shop_app/search_model.dart';
import 'package:bmi_calculator/modules/shop_app/search/cubit/states.dart';
import 'package:bmi_calculator/shared/componants/constants.dart';
import 'package:bmi_calculator/shared/network/end_points.dart';
import 'package:bmi_calculator/shared/network/remote/dio_helper.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SearchCubit extends Cubit<SearchStates>{
  SearchCubit() : super(SearchInitialState());

  static SearchCubit get(context) => BlocProvider.of(context);

  SearchModel? model;

  void search(String text) {
    emit(SearchLoadingState());
    DioHelper.postData(
      url: SEARCH,
      token: token,
      data: {
        'text':text,
      },
    ).then((value) {
      model = SearchModel.fromJson(value!.data);
      emit(SearchSuccessState());
    }).catchError((error){
      print(error.toString());
      emit(SearchErrorState());
    });
  }
}
