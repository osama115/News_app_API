import 'package:bmi_calculator/presentation/string_manager.dart';
import 'package:bmi_calculator/shared/componants/components.dart';
import 'package:flutter/material.dart';

class NewPostScreen extends StatelessWidget  {
  const NewPostScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:defaultAppBar(
        context: context,
        title: AppString.addpost,
      ),
    );
  }
}
