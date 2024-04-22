import 'package:bmi_calculator/layout/news_app/cubit/cubit.dart';
import 'package:bmi_calculator/presentation/values_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../layout/news_app/cubit/states.dart';
import '../../../presentation/string_manager.dart';
import '../../../shared/componants/components.dart';

class SearchScreen extends StatelessWidget {
   SearchScreen({super.key});

  var searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit,NewsStates>(
      listener: (context,state){},
      builder: (context,state){

        var list = NewsCubit.get(context).search;
        return  Scaffold(
          appBar: AppBar(),
          body: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(AppSize.s20),
                child: defualtFormField(
                    controller: searchController,
                    inputType: TextInputType.text,
                    onChanged: (value){
                      NewsCubit.get(context).getSearch(value);
                    },
                    validate: (String? value){
                      if(value!.isEmpty){
                        return AppString.searchMustNotBeEmpty;
                      }
                      return null;
                    },
                    labelText: AppString.search,
                    prefix: Icons.search),
              ),
              Expanded(child: articleBuilder(list, context,isSearch: true)),

            ],
          ),
        );
      },
    );
  }
}
