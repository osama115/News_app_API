import 'package:bloc/bloc.dart';
import 'package:bmi_calculator/layout/shop_app/cubit/cubit.dart';
import 'package:bmi_calculator/layout/shop_app/shop_layout.dart';
import 'package:bmi_calculator/layout/social_app/cubit/cubit.dart';
import 'package:bmi_calculator/layout/social_app/social_layout.dart';
import 'package:bmi_calculator/modules/shop_app/login/shop_login_screen.dart';
import 'package:bmi_calculator/modules/social_app/social_login/social_login_screen.dart';
import 'package:bmi_calculator/presentation/color_manager.dart';
import 'package:bmi_calculator/presentation/string_manager.dart';
import 'package:bmi_calculator/presentation/values_manager.dart';
import 'package:bmi_calculator/shared/bloc_observere.dart';
import 'package:bmi_calculator/shared/componants/constants.dart';
import 'package:bmi_calculator/shared/cubit/cubit.dart';
import 'package:bmi_calculator/shared/cubit/states.dart';
import 'package:bmi_calculator/shared/network/local/cache_helper.dart';
import 'package:bmi_calculator/shared/network/remote/dio_helper.dart';
import 'package:bmi_calculator/shared/styles/themes.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'firebase_options.dart';
import 'layout/news_app/cubit/cubit.dart';
import 'layout/news_app/news_layout.dart';
import 'modules/shop_app/on_boarding/on_boarding_screen.dart';

void main() async {
  // this widget is her to concern all thing un this method is finished and open the application
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  Bloc.observer = MyBlocObserver();
  DioHelper.init();
  await CacheHelper.init();

  bool? isDark = CacheHelper.getData(key: 'isDark');
  Widget widget;

  // bool? onBoarding = CacheHelper.getData(key: AppString.onBoarding);
  // token = CacheHelper.getData(key: AppString.token);
  uId = CacheHelper.getData(key: 'uId');


  // print(token);
  // if (onBoarding != null) {
  //   if (token != null)
  //     widget = ShopLayout();
  //   else
  //     widget = ShopLoginScreen();
  // } else {
  //   widget = OnBoardingsScreen();
  // }
  // print(onBoarding);

  if(uId !=null){
    widget =SocialLayout();
  }else{
    widget = SocialLoginScreen();
  }

  runApp(MyApp(
    isDark: isDark,
    startWidget: widget,
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key, this.isDark, this.startWidget});

  final bool? isDark;
  final Widget? startWidget;

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
            create: (context) => NewsCubit()
              ..getBusniess()
              ..getSports()
              ..getScience()),
        BlocProvider(
          create: (context) => AppCubit()..changeAppMode(fromShared: isDark),
        ),
        BlocProvider(
          create: (context) => ShopCubit()
            ..getHomeData()
            ..getCategories()
            ..getFavorites()
            ..getUserData(),
        ), BlocProvider(
          create: (context) => SocialCubit()..getUserData(),
        ),
      ],
      child: BlocConsumer<AppCubit, AppStates>(
        listener: (context, state) {},
        builder: (context, state) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: lightTheme,
            darkTheme: darkTheme,
            themeMode: ThemeMode.light,
            // AppCubit.get(context).isDark ? ThemeMode.dark : ThemeMode.light,
            home: startWidget,
            // startWidget,////////////////////////////////////some condition error check out
          );
        },
      ),
    );
  }
}
