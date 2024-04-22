import 'package:bmi_calculator/layout/social_app/cubit/cubit.dart';
import 'package:bmi_calculator/layout/social_app/cubit/states.dart';
import 'package:bmi_calculator/modules/social_app/new_post/new_post_screen.dart';
import 'package:bmi_calculator/presentation/color_manager.dart';
import 'package:bmi_calculator/presentation/values_manager.dart';
import 'package:bmi_calculator/shared/componants/components.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_iconly/flutter_iconly.dart';

import '../../presentation/string_manager.dart';

class SocialLayout extends StatelessWidget {
  const SocialLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SocialCubit, SocialStates>(
      listener: (context, state) {
        if(state is SocialNewPostState){
          navigateTo(context, NewPostScreen());
        }

      },
      builder: (context, state) {
        var cubit = SocialCubit.get(context);

        return Scaffold(
          appBar: AppBar(
            title: Text(cubit.titles[cubit.currentIndex]),
            actions: [IconButton(icon: Icon(IconlyBroken.notification), onPressed: () {  },),
             IconButton(icon: Icon(IconlyBroken.search), onPressed: () {  },)],
          ),
          body: cubit.screens[cubit.currentIndex],
          bottomNavigationBar: BottomNavigationBar(
            currentIndex: cubit.currentIndex,
            onTap: (index){
              cubit.changeBottomNav(index);
            },
            items: [
              BottomNavigationBarItem(icon: Icon(IconlyBroken.home),label: AppString.home),
              BottomNavigationBarItem(icon: Icon(IconlyBroken.chat),label: AppString.chat),
              BottomNavigationBarItem(icon: Icon(IconlyBroken.paperUpload),label: AppString.post),
              BottomNavigationBarItem(icon: Icon(IconlyBroken.location),label: AppString.user),
              BottomNavigationBarItem(icon: Icon(IconlyBroken.setting),label: AppString.setting),
            ],
          ),
        );
      },
    );
  }
}








// body: ConditionalBuilder(
//   condition: SocialCubit.get(context).model != null,
//   builder: (context) {
//     // var model = SocialCubit.get(context).model!;
//     // return Column(
//     //   children: [
//     //     // if (model.isEmailVerified = false)
//     //     if(FirebaseAuth.instance.currentUser!.emailVerified == false)
//     //       Container(
//     //         color: ColorManager.amberWO6,
//     //         child: Padding(
//     //           padding: const EdgeInsets.symmetric(
//     //             horizontal: AppSize.s20,
//     //           ),
//     //           child: Row(
//     //             children: [
//     //               Icon(Icons.info_outline),
//     //               SizedBox(
//     //                 width: AppSize.s15,
//     //               ),
//     //               Expanded(
//     //                   child: Text(AppString.pleaseVerifiedEmail)),
//     //               SizedBox(
//     //                 width: AppSize.s20,
//     //               ),
//     //               defaultTextButton(
//     //                 function: () {
//     //                   FirebaseAuth.instance.currentUser!
//     //                       .sendEmailVerification()
//     //                       .then((value) {
//     //                         ShowToast(text:AppString.checkYourMail, state:ToastStates.SUCCESS);
//     //                   })
//     //                       .catchError((error) {});
//     //                 },
//     //                 text: AppString.send,
//     //               ),
//     //             ],
//     //           ),
//     //         ),
//     //       )
//     //   ],
//     // );
//     return Column(
//       children: [
//
//       ],
//     );
//   },
//   fallback: (context) => Center(child: CircularProgressIndicator()),
// ));
