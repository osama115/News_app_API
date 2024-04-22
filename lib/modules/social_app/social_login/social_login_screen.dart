import 'package:bmi_calculator/layout/social_app/social_layout.dart';
import 'package:bmi_calculator/modules/social_app/social_login/cubit/cubit.dart';
import 'package:bmi_calculator/modules/social_app/social_login/cubit/states.dart';
import 'package:bmi_calculator/modules/social_app/social_register/social_register_screen.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../presentation/color_manager.dart';
import '../../../presentation/string_manager.dart';
import '../../../presentation/values_manager.dart';
import '../../../shared/componants/components.dart';
import '../../../shared/network/local/cache_helper.dart';

class SocialLoginScreen extends StatelessWidget {
  SocialLoginScreen({super.key});

  var formKey = GlobalKey<FormState>();
  var emailController = TextEditingController();
  var passWordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => SocialLoginCubit(),
      child: BlocConsumer<SocialLoginCubit, SocialLoginStates>(
        listener: (context, state) {
          if (state is SocialLoginErrorState) {
            ShowToast(
              text: state.error,
              state: ToastStates.ERROR,
            );
          }
          if (state is SocialLoginSuccessState) {
            CacheHelper.saveData(
              key: 'uId',
              value: state.uId,
            ).then((value) {
              navigateAndFinish(
                context,
                SocialLayout(),
              );
            });
          }
        },
        builder: (context, state) {
          return Scaffold(
            appBar: AppBar(),
            body: Center(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(AppSize.s20),
                  child: Form(
                    key: formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          AppString.Login,
                          style: Theme.of(context)
                              .textTheme
                              .headlineMedium!
                              .copyWith(
                                color: ColorManager.black,
                              ),
                        ),
                        Text(
                          AppString.loginNowSocial,
                          style: Theme.of(context)
                              .textTheme
                              .bodyLarge!
                              .copyWith(color: ColorManager.grey),
                        ),
                        const SizedBox(
                          height: AppSize.s30,
                        ),
                        defualtFormField(
                          controller: emailController,
                          inputType: TextInputType.emailAddress,
                          validate: (String? value) {
                            if (value!.isEmpty) {
                              return AppString.pleaseEmail;
                            }
                            return null;
                          },
                          labelText: AppString.emailAdr,
                          prefix: Icons.email_outlined,
                        ),
                        const SizedBox(
                          height: AppSize.s15,
                        ),
                        defualtFormField(
                          controller: passWordController,
                          inputType: TextInputType.visiblePassword,
                          suffix: SocialLoginCubit.get(context).suffix,
                          onSubmit: (value) {
                            if (formKey.currentState!.validate()) {
                              // SocialLoginCubit.get(context).userLogin(
                              //   email: emailController.text,
                              //   password: passWordController.text,
                              // );
                            }
                          },
                          isPassword: SocialLoginCubit.get(context).isPasword,
                          suffixPressed: () {
                            SocialLoginCubit.get(context)
                                .changePasswordVisiability();
                          },
                          validate: (String? value) {
                            if (value!.isEmpty) {
                              return AppString.pleasePass;
                            }
                            return null;
                          },
                          labelText: AppString.password,
                          prefix: Icons.lock_open_outlined,
                        ),
                        const SizedBox(
                          height: AppSize.s30,
                        ),
                        ConditionalBuilder(
                          condition: state is! SocialLoginLoadingState,
                          builder: (context) => defaultButton(
                            function: () {
                              if (formKey.currentState!.validate()) {
                                SocialLoginCubit.get(context).userLogin(
                                  email: emailController.text,
                                  password: passWordController.text,
                                );
                              }
                            },
                            text: AppString.login,
                            isUpperCase: true,
                          ),
                          fallback: (context) =>
                              Center(child: CircularProgressIndicator()),
                        ),
                        const SizedBox(
                          height: AppSize.s15,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text(AppString.dontHaveAnAccount),
                            defaultTextButton(
                              function: () {
                                navigateTo(context, SocialRegisterScreen());
                              },
                              text: AppString.register,
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
