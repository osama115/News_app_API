import 'package:bmi_calculator/layout/news_app/cubit/cubit.dart';
import 'package:bmi_calculator/layout/news_app/cubit/states.dart';
import 'package:bmi_calculator/presentation/values_manager.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../shared/componants/components.dart';
class ScienceScreen extends StatelessWidget {
  const ScienceScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit, NewsStates>(
      listener: (context, state) {},
      builder: (context, state)
      {
        var list = NewsCubit.get(context).science;
        return articleBuilder(list,context);
      },
    );
  }
}
