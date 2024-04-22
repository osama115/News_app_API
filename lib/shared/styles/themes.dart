
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../presentation/color_manager.dart';
import '../../presentation/values_manager.dart';

ThemeData darkTheme = ThemeData(
  primarySwatch: ColorManager.defaultColor,
  scaffoldBackgroundColor: ColorManager.hexcolorB,
  appBarTheme: AppBarTheme(
      titleSpacing: AppSize.s20,
      backgroundColor:ColorManager.hexcolorB,
      elevation: AppSize.s0,
      iconTheme: IconThemeData(
          color: ColorManager.white
      ),
      systemOverlayStyle:SystemUiOverlayStyle(
        statusBarColor: ColorManager.hexcolorB,
        statusBarIconBrightness: Brightness.light,
      ),
      titleTextStyle: TextStyle(
          fontFamily: 'jannah',
          color: ColorManager.white,
          fontSize: AppSize.s20,
          fontWeight: FontWeight.bold
      )
  ),
  bottomNavigationBarTheme: BottomNavigationBarThemeData(
    type: BottomNavigationBarType.fixed,
    selectedItemColor: ColorManager.defaultColor,
    unselectedItemColor: ColorManager.grey,
    elevation: AppSize.s20,
    backgroundColor: ColorManager.hexcolorB,
  ),
  textTheme: TextTheme(
      bodyLarge:TextStyle(
        fontSize: AppSize.s18,
        fontWeight: FontWeight.w600,
        color: ColorManager.white,
      ),
    titleMedium: TextStyle(
      fontSize: AppSize.s16,
      fontWeight: FontWeight.w600,
      color: ColorManager.white,
      height: AppSize.s1_3
    ),
  ),
  fontFamily: 'jannah',
);


ThemeData lightTheme = ThemeData(
    primarySwatch:ColorManager.defaultColor,
    scaffoldBackgroundColor:ColorManager.white ,
    appBarTheme: AppBarTheme(
        titleSpacing: AppSize.s20,
        backgroundColor: ColorManager.white,
        elevation: AppSize.s0,
        iconTheme: IconThemeData(
            color: ColorManager.black
        ),
        systemOverlayStyle:SystemUiOverlayStyle(
          statusBarColor: ColorManager.white,
          statusBarIconBrightness: Brightness.dark,
        ),
        titleTextStyle: TextStyle(
            fontFamily: 'jannah',
            color: ColorManager.black,
            fontSize: AppSize.s20,
            fontWeight: FontWeight.bold
        )
    ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      type: BottomNavigationBarType.fixed,
      selectedItemColor: ColorManager.defaultColor,
      unselectedItemColor: ColorManager.grey,
      elevation: AppSize.s20,
      backgroundColor: ColorManager.white,
    ),
    textTheme: TextTheme(
        bodyLarge:TextStyle(
          fontSize: AppSize.s18,
          fontWeight: FontWeight.w600,
        ),
        titleMedium: TextStyle(
          fontSize: AppSize.s16,
          fontWeight: FontWeight.w600,
          color: ColorManager.black,
          height: AppSize.s1_3
        ),
    ),
  fontFamily: 'jannah',
);