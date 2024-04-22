import 'dart:ffi';

import 'package:bmi_calculator/presentation/color_manager.dart';
import 'package:bmi_calculator/presentation/values_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';

import '../../../presentation/string_manager.dart';

class FeedsScreen extends StatelessWidget {
  const FeedsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: BouncingScrollPhysics(),
      child: Column(
        children: [
          Card(
            clipBehavior: Clip.antiAliasWithSaveLayer,
            elevation: AppSize.s5,
            margin: EdgeInsets.all(AppSize.s8),
            child:
                Stack(alignment: AlignmentDirectional.bottomStart, children: [
              Image(
                image: NetworkImage(
                  'https://img.freepik.com/free-photo/portrait-young-girl-looking-happy-pointing-right_23-2149284207.jpg?t=st=1711453273~exp=1711456873~hmac=dc8b040a060e9e989326eaebf2e52369e122f929420f5470ebd11d3908af45b3&w=996',
                ),
                fit: BoxFit.cover,
                height: AppSize.s200,
                width: double.infinity,
              ),
              Padding(
                padding: const EdgeInsets.all(AppSize.s8),
                child: Text(
                  AppString.communicateWithFriends,
                  style: Theme.of(context).textTheme.titleMedium!.copyWith(
                      color: ColorManager.white, fontSize: AppSize.s14),
                ),
              )
            ]),
          ),
          ListView.separated(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            itemBuilder: (context, index) => buildPostItem(context),
            itemCount: 10,
            separatorBuilder: ( context,  index) => SizedBox(height: AppSize.s8,) ,
          ),
          SizedBox(height: AppSize.s8,),
        ],
      ),
    );
  }

  Widget buildPostItem(context) => Card(
        clipBehavior: Clip.antiAliasWithSaveLayer,
        elevation: AppSize.s5,
        margin: EdgeInsets.symmetric(horizontal: AppSize.s8),
        child: Padding(
          padding: const EdgeInsets.all(AppSize.s10),
          child: Column(
            children: [
              Row(
                children: [
                  CircleAvatar(
                    radius: AppSize.s30,
                    backgroundImage: NetworkImage(
                      'https://img.freepik.com/free-photo/excited-young-pretty-caucasian-girl-with-beret-hat-keeps-fists-chest_141793-103491.jpg?w=900&t=st=1711454933~exp=1711455533~hmac=98c935889e92da0da0c39cd9404bf3de0edee2a4a11eecf08ece76f9895ace58',
                    ),
                  ),
                  SizedBox(
                    width: AppSize.s15,
                  ),
                  Expanded(
                      child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Text(
                            AppString.osamahamed,
                            style: TextStyle(height: AppSize.s1_4),
                          ),
                          SizedBox(
                            width: AppSize.s5,
                          ),
                          Icon(
                            Icons.check_circle,
                            color: ColorManager.defaultColor,
                            size: AppSize.s16,
                          )
                        ],
                      ),
                      Text(
                        AppString.date,
                        style: Theme.of(context).textTheme.bodySmall!.copyWith(
                            height: AppSize.s1_4,
                            color: ColorManager.lightGrey),
                      ),
                    ],
                  )),
                  SizedBox(
                    width: AppSize.s15,
                  ),
                  IconButton(
                      onPressed: () {},
                      icon: Icon(
                        Icons.more_horiz,
                        size: AppSize.s16,
                      ))
                ],
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: AppSize.s15),
                child: Container(
                  width: double.infinity,
                  height: AppSize.s1,
                  color: ColorManager.grey300,
                ),
              ),
              Text(
                AppString.loremText,
                style: Theme.of(context).textTheme.titleMedium,
              ),
              Padding(
                padding:
                    const EdgeInsets.only(bottom: AppSize.s10, top: AppSize.s5),
                child: Container(
                  width: double.infinity,
                  child: Wrap(
                    children: [
                      Padding(
                        padding:
                            const EdgeInsetsDirectional.only(end: AppSize.s6),
                        child: Container(
                          height: AppSize.s25,
                          child: MaterialButton(
                            onPressed: () {},
                            height: AppSize.s25,
                            minWidth: AppSize.s1,
                            padding: EdgeInsets.zero,
                            child: Text(
                              AppString.software,
                              style: Theme.of(context)
                                  .textTheme
                                  .bodySmall!
                                  .copyWith(color: ColorManager.defaultColor),
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding:
                            const EdgeInsetsDirectional.only(end: AppSize.s6),
                        child: Container(
                          height: AppSize.s25,
                          child: MaterialButton(
                            onPressed: () {},
                            height: AppSize.s25,
                            minWidth: AppSize.s1,
                            padding: EdgeInsets.zero,
                            child: Text(
                              AppString.flutter,
                              style: Theme.of(context)
                                  .textTheme
                                  .bodySmall!
                                  .copyWith(color: ColorManager.defaultColor),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                width: double.infinity,
                height: AppSize.s140,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(AppSize.s4),
                    image: DecorationImage(
                      image: NetworkImage(
                        'https://img.freepik.com/free-photo/portrait-young-girl-looking-happy-pointing-right_23-2149284207.jpg?t=st=1711453273~exp=1711456873~hmac=dc8b040a060e9e989326eaebf2e52369e122f929420f5470ebd11d3908af45b3&w=996',
                      ),
                      fit: BoxFit.cover,
                    )),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: AppSize.s5),
                child: Row(
                  children: [
                    Expanded(
                      child: InkWell(
                        child: Padding(
                          padding:
                              const EdgeInsets.symmetric(vertical: AppSize.s5),
                          child: Row(
                            children: [
                              Icon(
                                IconlyBroken.heart,
                                size: AppSize.s16,
                                color: ColorManager.red,
                              ),
                              SizedBox(
                                width: AppSize.s5,
                              ),
                              Text(
                                '1200',
                                style: Theme.of(context).textTheme.bodySmall,
                              ),
                            ],
                          ),
                        ),
                        onTap: () {},
                      ),
                    ),
                    Expanded(
                      child: InkWell(
                        child: Padding(
                          padding:
                              const EdgeInsets.symmetric(vertical: AppSize.s5),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Icon(
                                IconlyBroken.chat,
                                size: AppSize.s16,
                                color: ColorManager.amber,
                              ),
                              SizedBox(
                                width: AppSize.s5,
                              ),
                              Text(
                                '120 comments',
                                style: Theme.of(context).textTheme.bodySmall,
                              ),
                            ],
                          ),
                        ),
                        onTap: () {},
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: AppSize.s10),
                child: Container(
                  width: double.infinity,
                  height: AppSize.s1,
                  color: ColorManager.grey300,
                ),
              ),
              Row(
                children: [
                  Expanded(
                    child: InkWell(
                      child: Row(
                        children: [
                          CircleAvatar(
                            radius: AppSize.s20,
                            backgroundImage: NetworkImage(
                              'https://img.freepik.com/free-photo/excited-young-pretty-caucasian-girl-with-beret-hat-keeps-fists-chest_141793-103491.jpg?w=900&t=st=1711454933~exp=1711455533~hmac=98c935889e92da0da0c39cd9404bf3de0edee2a4a11eecf08ece76f9895ace58',
                            ),
                          ),
                          SizedBox(
                            width: AppSize.s15,
                          ),
                          Text(
                            AppString.writeACommment,
                            style: Theme.of(context)
                                .textTheme
                                .bodySmall!
                                .copyWith(color: ColorManager.lightGrey),
                          ),
                        ],
                      ),
                      onTap: () {},
                    ),
                  ),
                  InkWell(
                    child: Row(
                      children: [
                        Icon(
                          IconlyBroken.heart,
                          size: AppSize.s16,
                          color: ColorManager.red,
                        ),
                        SizedBox(
                          width: AppSize.s5,
                        ),
                        Text(
                          'Like',
                          style: Theme.of(context).textTheme.bodySmall,
                        ),
                      ],
                    ),
                    onTap: () {},
                  ),
                ],
              )
            ],
          ),
        ),
      );
}
