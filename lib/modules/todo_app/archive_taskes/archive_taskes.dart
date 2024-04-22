import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../shared/componants/components.dart';
import '../../../shared/cubit/cubit.dart';
import '../../../shared/cubit/states.dart';



class ArchivedTaskes extends StatelessWidget {
  const ArchivedTaskes({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit,AppStates>(
      listener: (context,state){},
      builder: (context,stste){
        var tasks=AppCubit.get(context).archiveTasks;
        return tasksBuilder(tasks: tasks);
      },
    );
  }
}
