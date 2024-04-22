import 'package:flutter/material.dart';

import '../../../shared/componants/components.dart';

class LoginScreen extends StatefulWidget {
  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  var emailController = TextEditingController();

  var passwordController = TextEditingController();

  var formKey = GlobalKey<FormState>();

  bool isPasswordShow =true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Center(
          child: Form(
            key: formKey,
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Login',
                    style: TextStyle(
                      fontSize: 40.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(
                    height: 40.0,
                  ),
                  defualtFormField(
                    controller: emailController,
                    inputType: TextInputType.emailAddress,
                    labelText: "Email",
                    prefix: Icons.email,
                    validate: (String? value){
                      if(value!.isEmpty){
                         return "email must not be empty";
                      }
                      return null;
                    }
                  ),
                  SizedBox(
                    height: 15.0,
                  ),
              defualtFormField(
                  controller: passwordController,
                  inputType: TextInputType.visiblePassword,
                  labelText: "Password",
                  prefix: Icons.lock,
                  validate: (String? value){
                    if(value!.isEmpty){
                      return "password must not be empty";
                    }
                    return null;
                  },
                suffix:isPasswordShow? Icons.visibility:Icons.visibility_off,
                suffixPressed: (){
                    setState(() {
                      isPasswordShow = !isPasswordShow;
                    });
                },
                isPassword: isPasswordShow,
              ) ,
                  SizedBox(
                    height: 20.0,
                  ),
                  defaultButton(
                    text: "login",
                    function: () {
                      if (formKey.currentState!.validate()) {
                        print(emailController.text);
                        print(passwordController.text);
                      }
                    },
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Don\'t have an account?',
                      ),
                      TextButton(
                        onPressed: () {},
                        child: Text(
                          'Register Now',
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
