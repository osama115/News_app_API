import 'package:bmi_calculator/layout/social_app/cubit/cubit.dart';
import 'package:bmi_calculator/layout/social_app/cubit/states.dart';
import 'package:bmi_calculator/modules/social_app/edit_profile/edit_profile_screen.dart';
import 'package:bmi_calculator/shared/componants/components.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_iconly/flutter_iconly.dart';

import '../../../presentation/string_manager.dart';
import '../../../presentation/values_manager.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SocialCubit, SocialStates>(
      listener: (BuildContext context, SocialStates state) {},
      builder: (BuildContext context, SocialStates state) {
    var userModel = SocialCubit.get(context).userModel;
    return Padding(
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
                  child: Container(
                    width: double.infinity,
                    height: AppSize.s140,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(AppSize.s4),
                            topRight: Radius.circular(AppSize.s4)),
                        image: DecorationImage(
                          image: NetworkImage('${userModel!.cover}'),
                          fit: BoxFit.cover,
                        )),
                  ),
                ),
                CircleAvatar(
                  radius: AppSize.s64,
                  backgroundColor: Theme.of(context).scaffoldBackgroundColor,
                  child: CircleAvatar(
                    radius: AppSize.s60,
                    backgroundImage: NetworkImage('${userModel!.image}'),
                  ),
                )
              ],
            ),
          ),
          SizedBox(
            height: AppSize.s5,
          ),
          Text(
            '${userModel!.name}',
            style: Theme.of(context).textTheme.bodyLarge,
          ),
          Text(
            '${userModel!.bio}',
            style: Theme.of(context).textTheme.bodySmall,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: AppSize.s20),
            child: Row(
              children: [
                Expanded(
                  child: InkWell(
                    child: Column(
                      children: [
                        Text(
                          '100',
                          style: Theme.of(context).textTheme.titleSmall,
                        ),
                        Text(
                          AppString.post,
                          style: Theme.of(context).textTheme.bodySmall,
                        ),
                      ],
                    ),
                    onTap: () {},
                  ),
                ),
                Expanded(
                  child: InkWell(
                    child: Column(
                      children: [
                        Text(
                          '265',
                          style: Theme.of(context).textTheme.titleSmall,
                        ),
                        Text(
                          AppString.addPhoto,
                          style: Theme.of(context).textTheme.bodySmall,
                        ),
                      ],
                    ),
                    onTap: () {},
                  ),
                ),
                Expanded(
                  child: InkWell(
                    child: Column(
                      children: [
                        Text(
                          '10k',
                          style: Theme.of(context).textTheme.titleSmall,
                        ),
                        Text(
                          AppString.following,
                          style: Theme.of(context).textTheme.bodySmall,
                        ),
                      ],
                    ),
                    onTap: () {},
                  ),
                ),
                Expanded(
                  child: InkWell(
                    child: Column(
                      children: [
                        Text(
                          '20k',
                          style: Theme.of(context).textTheme.titleSmall,
                        ),
                        Text(
                          AppString.followers,
                          style: Theme.of(context).textTheme.bodySmall,
                        ),
                      ],
                    ),
                    onTap: () {},
                  ),
                ),
              ],
            ),
          ),
          Row(
            children: [
              Expanded(
                child: OutlinedButton(
                  onPressed: () {},
                  child: Text(AppString.addPhoto),
                ),
              ),
              SizedBox(
                width: AppSize.s10,
              ),
              OutlinedButton(
                  onPressed: () {
                    navigateTo(context, EditProfileScreen());
                  },
                  child: Icon(
                    IconlyBroken.edit,
                    size: AppSize.s16,
                  ))
            ],
          )
        ],
      ),
    );
      },
    );
  }
}
