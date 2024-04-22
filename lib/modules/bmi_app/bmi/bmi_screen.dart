
import 'dart:math';

import 'package:flutter/material.dart';

import '../../../presentation/assets_manager.dart';
import '../../../presentation/color_manager.dart';
import '../../../presentation/font_manager.dart';
import '../../../presentation/string_manager.dart';
import '../../../presentation/values_manager.dart';
import '../bmi_result/result_screen.dart';

class BmiScreen extends StatefulWidget {
  const BmiScreen({Key? key}) : super(key: key);

  @override
  _BmiScreenState createState() => _BmiScreenState();
}
bool isMale =true;
double height =AppSize.s120;
int weight = 40;
int age = 20;

class _BmiScreenState extends State<BmiScreen> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text(AppString.bmiCalculator),
        ),
        body: Column(
          children: [
            ////////////1/////////////
            Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(AppSize.s20),
                  child: Row(
                    children: [
                      Expanded(
                        child: GestureDetector(
                          onTap: (){
                            setState(() {
                              isMale=true;
                            });
                          },
                          child: Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(AppSize.s10),
                                color: isMale ? ColorManager.blue : ColorManager.grey400),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Image(image: AssetImage(ImageAssets.male),
                                  width: AppSize.s90,
                                  height: AppSize.s90,
                                ),
                                SizedBox(
                                  height: AppSize.s5,
                                ),
                                Text(
                                  AppString.male,
                                  style: TextStyle(
                                    fontSize: FontSize.s25,
                                    fontWeight: FontWeight.bold,
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: AppSize.s20,
                      ),
                      Expanded(
                        child: GestureDetector(
                          onTap: (){
                            setState(() {
                              isMale=false;
                            });
                          },
                          child: Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(AppSize.s10),
                                color: !isMale ? ColorManager.blue : ColorManager.grey400),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Image(image: AssetImage(ImageAssets.female),
                                  width: AppSize.s90,
                                  height: AppSize.s90,
                                ),
                                SizedBox(
                                  height: AppSize.s5,
                                ),
                                Text(
                                  AppString.female,
                                  style: TextStyle(
                                    fontSize: FontSize.s25,
                                    fontWeight: FontWeight.bold,
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                )),
            ///////////2////////////
            Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: AppSize.s20),
                  child: Container(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          AppString.height,
                          style: TextStyle(
                            fontSize: FontSize.s25,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.baseline,
                          mainAxisAlignment: MainAxisAlignment.center,
                          textBaseline: TextBaseline.alphabetic,
                          children: [
                            Text(
                              '${height.round()}',
                              style: TextStyle(
                                fontSize: FontSize.s40,
                                fontWeight: FontWeight.w900,
                              ),
                            ),
                            SizedBox(width: AppSize.s5,),
                            Text(
                              AppString.cm,
                              style: TextStyle(
                                fontSize: FontSize.s20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                        Slider(value: height,
                            max:AppSize.s220,
                            min: AppSize.s80,
                            onChanged: (value){
                              setState(() {
                                height=value;
                              });
                            })
                      ],
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(AppSize.s10),
                      color: ColorManager.grey400,
                    ),
                  ),
                )
            ),
            //////////3////////////
            Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(AppSize.s20),
                  child: Row(
                    children: [
                      Expanded(
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(AppSize.s10),
                            color: ColorManager.grey400,),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                AppString.weight,
                                style: TextStyle(
                                  fontSize: FontSize.s25,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text(
                                '$weight',
                                style: TextStyle(
                                  fontSize: FontSize.s40,
                                  fontWeight: FontWeight.w900,
                                ),
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  FloatingActionButton(
                                    onPressed: (){
                                      setState(() {
                                        weight--;
                                      });
                                    },
                                    heroTag: AppString.weight_,
                                    mini: true,
                                    child: Icon(Icons.remove),),
                                  FloatingActionButton(
                                    onPressed: (){
                                      setState(() {
                                        weight++;
                                      });
                                    },
                                    heroTag: AppString.weightP,
                                    mini: true,
                                    child: Icon(Icons.add),),

                                ],
                              )

                            ],
                          ),
                        ),
                      ),
                      SizedBox(width:AppSize.s20 ,),
                      Expanded(
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(AppSize.s10),
                            color: ColorManager.grey400,),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                AppString.age,
                                style: TextStyle(
                                  fontSize: FontSize.s25,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text(
                                '$age',
                                style: TextStyle(
                                  fontSize: FontSize.s40,
                                  fontWeight: FontWeight.w900,
                                ),
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  FloatingActionButton(
                                    onPressed: (){
                                      setState(() {
                                        age--;
                                      });
                                    },
                                    heroTag: AppString.age_,
                                    mini: true,
                                    child: Icon(Icons.remove),),
                                  FloatingActionButton(
                                    onPressed: (){
                                      setState(() {
                                        age++;
                                      });
                                    },
                                    heroTag: AppString.ageP,
                                    mini: true,
                                    child: Icon(Icons.add),),

                                ],
                              )

                            ],
                          ),
                        ),
                      ),

                    ],
                  ),
                )
            ),
            //////////4///////////
            Container(
              width: double.infinity,
              color: ColorManager.blue,
              child: Builder(
                builder: (context) =>  MaterialButton(
                  onPressed: () {
                    double result = weight / pow(height/AppSize.s100, AppSize.s2);
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => ResultScreen(
                              age: age,result:result.round(),isMale: isMale,
                            )));},
                  height: AppSize.s50,
                  child: Text(
                    AppString.calculate,
                    style: TextStyle(color: ColorManager.white),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}