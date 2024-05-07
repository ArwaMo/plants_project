// ignore_for_file: avoid_types_as_parameter_names, non_constant_identifier_names, must_be_immutable, use_build_context_synchronously

import 'package:final_project/models/person_model.dart';
import 'package:final_project/screens/home_screen.dart';
import 'package:final_project/screens/sign_up_screen.dart';
import 'package:final_project/services/services.dart';
import 'package:final_project/widgets/button_widget.dart';
import 'package:final_project/widgets/rich_text_widget.dart';
import 'package:final_project/widgets/text_field_widget.dart';
import 'package:flutter/material.dart';

class LogInScreen extends StatelessWidget {
  LogInScreen({super.key});

  TextEditingController conEmail = TextEditingController();
  TextEditingController conPass = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Log in'),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextFieldWidget(
                controller: conEmail,
                type: TextInputType.emailAddress,
                text: 'Enter your Email',
              ),
              const SizedBox(
                height: 10,
              ),
              TextFieldWidget(
                controller: conPass,
                type: TextInputType.visiblePassword,
                text: 'Enter your Password',
              ),
              const SizedBox(
                height: 10,
              ),
              RichTextWidget(
                text1: 'don’t  have an account? ',
                text2: 'Sign up',
                fun: () {
                  Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(builder: (context) => SignUpScreen()),
                      (Route) => false);
                },
              ),
              const SizedBox(
                height: 40,
              ),
              ButtonWidget(
                text: 'Log in',
                fun: () async {
                  List<Map<String, dynamic>> resEmail =
                      await Services().getEmailPassUser(
                    conEmail.text,
                    conPass.text,
                  );
                  //get name user

                  if (resEmail.isEmpty) {
                    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                      backgroundColor: Colors.red,
                      content: Text(
                          'The user is not registered before, please Sign Up'),
                    ));
                  } else {
                    Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(
                            builder: (context) => HomeScreen(
                                  userName: resEmail,
                                )),
                        (Route) => false);
                  }
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
