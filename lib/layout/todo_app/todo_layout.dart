import 'package:bmi_calculator/presentation/color_manager.dart';
import 'package:bmi_calculator/presentation/values_manager.dart';
import 'package:bmi_calculator/shared/componants/components.dart';
import 'package:bmi_calculator/shared/cubit/cubit.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

import '../../shared/cubit/states.dart';

class HomeLayout extends StatelessWidget {
  var scaffoldKey = GlobalKey<ScaffoldState>();
  var formKey = GlobalKey<FormState>();

  var titleController = TextEditingController();
  var timeController = TextEditingController();
  var dateController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => AppCubit()..createDatabase(),
      child: BlocConsumer<AppCubit, AppStates>(
        listener: (BuildContext context, AppStates state) {
          if(state is AppInsertDataBaseState){
            Navigator.pop(context);
          }
        },
        builder: (BuildContext context, AppStates state) {
          AppCubit cubit = AppCubit.get(context);
          return Scaffold(
            key: scaffoldKey,
            appBar: AppBar(
              title: Text(cubit.title[cubit.currentIndex]),
            ),
            body: ConditionalBuilder(
              condition: state is! AppGetDataBaseLoadingState,
              builder: (context) => cubit.screen[cubit.currentIndex],
              fallback: (context) => Center(child: CircularProgressIndicator()),
            ),
            floatingActionButton: FloatingActionButton(
              backgroundColor: ColorManager.blue,
              onPressed: () {
                if (cubit.isBotttomSheet) {
                  if (formKey.currentState!.validate()) {
                    cubit.insertToDatabase(
                                title: titleController.text,
                                time: timeController.text,
                                date: dateController.text);

                  }
                } else {
                  scaffoldKey.currentState!
                      .showBottomSheet(
                          (context) => Container(
                                color: Colors.white,
                                padding: EdgeInsets.all(AppSize.s20),
                                child: Form(
                                  key: formKey,
                                  child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      defualtFormField(
                                        controller: titleController,
                                        inputType: TextInputType.text,
                                        onTap: () {
                                          print('title tapped');
                                        },
                                        validate: (String? value) {
                                          if (value!.isEmpty) {
                                            return "title must not be empty";
                                          }
                                          return null;
                                        },
                                        labelText: 'task time',
                                        prefix: Icons.title,
                                      ),
                                      const SizedBox(
                                        height: AppSize.s15,
                                      ),
                                      defualtFormField(
                                        controller: timeController,
                                        inputType: TextInputType.datetime,
                                        onTap: () {
                                          showTimePicker(
                                                  context: context,
                                                  initialTime: TimeOfDay.now())
                                              .then((value) {
                                            timeController.text = value!
                                                .format(context)
                                                .toString();
                                            print(value.format(context));
                                          });
                                        },
                                        validate: (String? value) {
                                          if (value!.isEmpty) {
                                            return "time must not be empty";
                                          }
                                          return null;
                                        },
                                        labelText: 'task time',
                                        prefix: Icons.watch_later_outlined,
                                      ),
                                      const SizedBox(
                                        height: AppSize.s15,
                                      ),
                                      defualtFormField(
                                        controller: dateController,
                                        inputType: TextInputType.datetime,
                                        onTap: () {
                                          showDatePicker(
                                                  context: context,
                                                  initialDate: DateTime.now(),
                                                  firstDate: DateTime.now(),
                                                  lastDate: DateTime.parse(
                                                      '2023-12-28'))
                                              .then((value) {
                                            dateController.text =
                                                DateFormat.yMMMd()
                                                    .format(value!);
                                          });
                                        },
                                        validate: (String? value) {
                                          if (value!.isEmpty) {
                                            return "date must not be empty";
                                          }
                                          return null;
                                        },
                                        labelText: 'task date',
                                        prefix: Icons.calendar_today,
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                          elevation: AppSize.s15)
                      .closed
                      .then((value) {
                    cubit.changeBotomSheetState(
                      isShow: false,
                      icon: Icons.edit,
                    );
                  });
                  cubit.changeBotomSheetState(
                    isShow: true,
                    icon: Icons.add,
                  );
                }
              },
              child: Icon(cubit.facIcon),
            ),
            bottomNavigationBar: BottomNavigationBar(
              type: BottomNavigationBarType.fixed,
              currentIndex: cubit.currentIndex,
              onTap: (index) {
                cubit.changeIndex(index);
              },
              items: [
                BottomNavigationBarItem(
                    icon: Icon(Icons.menu), label: "Taskes"),
                BottomNavigationBarItem(
                    icon: Icon(Icons.check_circle_outline), label: "Done"),
                BottomNavigationBarItem(
                    icon: Icon(Icons.archive_outlined), label: "Archived"),
              ],
            ),
          );
        },
      ),
    );
  }
}
//
// Future<String> getName() async {
//   return "osama hamed";
// }
