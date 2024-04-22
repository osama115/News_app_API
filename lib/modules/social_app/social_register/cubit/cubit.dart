import 'package:bloc/bloc.dart';
import 'package:bmi_calculator/modules/social_app/social_register/cubit/states.dart';

import 'package:bmi_calculator/shared/network/end_points.dart';
import 'package:bmi_calculator/shared/network/remote/dio_helper.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../model/social_app/social_user_model.dart';

class SocialRegisterCubit extends Cubit<SocialRegisterStates> {
  SocialRegisterCubit() : super(SocialRegisterInitialState());

  static SocialRegisterCubit get(context) => BlocProvider.of(context);

  void userRegister({
    required String name,
    required String email,
    required String password,
    required String phone,
  }) {
    emit(SocialRegisterLoadingState());

    FirebaseAuth.instance
        .createUserWithEmailAndPassword(
      email: email,
      password: password,
    )
        .then((value) {
      print(value.user!.email);
      print(value.user!.uid);
      createUser(
        name: name,
        email: email,
        password: password,
        phone: phone,
        uId: value.user!.uid,
      );
      // emit(SocialRegisterSuccessState());
    }).catchError((error) {
      emit(SocialRegisterErrorState(error.toString()));
    });
  }

  void createUser({
    required String name,
    required String email,
    required String password,
    required String phone,
    required String uId,
  }) {
    SocialUserModel model = SocialUserModel(
      name: name,
      email: email,
      password: password,
      phone: phone,
      uId: uId,
      bio: 'write your bio ...',
      image: 'https://img.freepik.com/free-photo/smiley-little-boy-isolated-pink_23-2148984800.jpg?w=740&t=st=1711545369~exp=1711545969~hmac=cc00231321d08c58a5129bd8b99c4846a65defc13bc7b697cee00b172ebebf00',
      cover: 'https://img.freepik.com/free-photo/smiley-little-boy-isolated-pink_23-2148984800.jpg?w=740&t=st=1711545369~exp=1711545969~hmac=cc00231321d08c58a5129bd8b99c4846a65defc13bc7b697cee00b172ebebf00',
      isEmailVerified: false,
    );

    FirebaseFirestore.instance
        .collection('users')
        .doc(uId)
        .set(model.toMap())
        .then((value) {
      emit(SocialCreateUserSuccessState());
    }).catchError((error) {
      emit(SocialCreateUserErrorState(error.toString()));
    });
  }

  IconData suffix = Icons.visibility_outlined;
  bool isPasword = true;

  void changePasswordVisiability() {
    isPasword = !isPasword;
    suffix =
        isPasword ? Icons.visibility_outlined : Icons.visibility_off_outlined;
    emit(SocialRegisterChangePasswordVisibilityState());
  }
}
