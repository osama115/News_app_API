import 'package:bloc/bloc.dart';
import 'package:bmi_calculator/modules/counter_app/counter/cubit/states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CounterCubit extends Cubit<CounterStates>{
  CounterCubit() : super (CounterInitialState());

 // to be more easly when you use the cubit in many palces
  static CounterCubit get(context) => BlocProvider.of(context);
   int counter = 1;

   void minus (){
     counter--;
     emit(CounterMinusState(counter));
}
  void plus (){
    counter++;
    emit(CounterPlusState(counter));
  }
}