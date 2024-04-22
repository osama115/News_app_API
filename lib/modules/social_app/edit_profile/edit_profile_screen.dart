import 'dart:io';

import 'package:bmi_calculator/layout/social_app/cubit/cubit.dart';
import 'package:bmi_calculator/layout/social_app/cubit/states.dart';
import 'package:bmi_calculator/presentation/string_manager.dart';
import 'package:bmi_calculator/presentation/values_manager.dart';
import 'package:bmi_calculator/shared/componants/components.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:image_picker/image_picker.dart';

class EditProfileScreen extends StatelessWidget {
  EditProfileScreen({super.key});

  var nameController = TextEditingController();
  var bioController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SocialCubit, SocialStates>(
      listener: (context, state) {},
      builder: (context, state) {
        var userModel = SocialCubit.get(context).userModel;

        var profileImage = SocialCubit.get(context).profileImage;
        var coverImage = SocialCubit.get(context).coverImage;

        // dynamic ddod = profileImage == null ? NetworkImage('${userModel!.image}') : FileImage(profileImage as File);

        nameController.text = userModel!.name!;
        bioController.text = userModel!.bio!;
        return Scaffold(
          appBar: defaultAppBar(
              context: context,
              title: AppString.editProfile,
              actions: [
                defaultTextButton(function: () {
                  SocialCubit.get(context).uploadProfileImage();
                }, text: AppString.update),
                SizedBox(
                  width: AppSize.s15,
                ),
              ]),
          body: Padding(
            padding: const EdgeInsets.all(AppSize.s8),
            child: Column(
              children: [
                Container(
                  height: AppSize.s190,
                  child: Stack(
                    alignment: AlignmentDirectional.bottomCenter,
                    children: [
                      Align(
                        alignment: AlignmentDirectional.topCenter,
                        child: Stack(
                          alignment: AlignmentDirectional.topEnd,
                          children: [
                            Container(
                              width: double.infinity,
                              height: AppSize.s140,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(AppSize.s4),
                                      topRight: Radius.circular(AppSize.s4)),
                                  image: DecorationImage(
                                    image: coverImage == null ? NetworkImage('${userModel!.cover}') as ImageProvider<Object>  : FileImage(coverImage) as ImageProvider<Object> ,//////imporrtant///////
                                    fit: BoxFit.cover,
                                  )),
                            ),
                            IconButton(
                              onPressed: () {
                                SocialCubit.get(context).getCoverImage();
                              },
                              icon: CircleAvatar(
                                radius: AppSize.s20,
                                child: Icon(
                                  IconlyBroken.camera,
                                  size: AppSize.s16,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Stack(
                        alignment: AlignmentDirectional.bottomEnd,
                        children: [
                          CircleAvatar(
                            radius: AppSize.s64,
                            backgroundColor:
                                Theme.of(context).scaffoldBackgroundColor,
                            child: CircleAvatar(
                              radius: AppSize.s60,
                              backgroundImage: profileImage == null ? NetworkImage('${userModel!.image}') as ImageProvider<Object>?  : FileImage(profileImage) as ImageProvider<Object>? ,///////important ////////
                            ),
                          ),
                          IconButton(
                            onPressed: () {
                              SocialCubit.get(context).getProfileImage();
                            },
                            icon: CircleAvatar(
                              radius: AppSize.s20,
                              child: Icon(
                                IconlyBroken.camera,
                                size: AppSize.s16,
                              ),
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: AppSize.s20,
                ),
                defualtFormField(
                    controller: nameController,
                    inputType: TextInputType.name,
                    validate: (String? value) {
                      if (value!.isEmpty) {
                        return AppString.nameMustNotBeEmpty;
                      }
                      return null;
                    },
                    labelText: AppString.name,
                    prefix: IconlyBroken.user2),
                SizedBox(
                  height: AppSize.s10,
                ),
                defualtFormField(
                    controller: bioController,
                    inputType: TextInputType.text,
                    validate: (String? value) {
                      if (value!.isEmpty) {
                        return AppString.bioMustNotBeEmpty;
                      }
                      return null;
                    },
                    labelText: AppString.bio,
                    prefix: IconlyBroken.infoCircle),
              ],
            ),
          ),
        );
      },
    );
  }
}
