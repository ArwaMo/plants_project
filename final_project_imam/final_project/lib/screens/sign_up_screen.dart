// ignore_for_file: prefer_const_constructors, non_constant_identifier_names, avoid_types_as_parameter_names, must_be_immutable, use_build_context_synchronously

import 'dart:async';

import 'package:final_project/models/person_model.dart';
import 'package:final_project/screens/log_in_screen.dart';
import 'package:final_project/services/services.dart';
import 'package:final_project/widgets/button_widget.dart';
import 'package:final_project/widgets/rich_text_widget.dart';
import 'package:final_project/widgets/text_field_widget.dart';
import 'package:flutter/material.dart';

class SignUpScreen extends StatelessWidget {
  SignUpScreen({super.key, this.objectUser});

  TextEditingController conName = TextEditingController();
  TextEditingController conEmail = TextEditingController();
  TextEditingController conPass = TextEditingController();
  final Person? objectUser;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Sign Up'),
          centerTitle: true,
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            SizedBox(
              height: 20,
            ),
            TextFieldWidget(
              controller: conName,
              type: TextInputType.name,
              text: 'Enter your Name',
            ),
            SizedBox(
              height: 10,
            ),
            TextFieldWidget(
              controller: conEmail,
              type: TextInputType.emailAddress,
              text: 'Enter your Email',
            ),
            SizedBox(
              height: 10,
            ),
            TextFieldWidget(
              controller: conPass,
              type: TextInputType.visiblePassword,
              text: 'Enter your Password',
            ),
            SizedBox(
              height: 10,
            ),
            RichTextWidget(
              text1: 'have an account? ',
              text2: 'Log in',
              fun: () {
                Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(builder: (context) => LogInScreen()),
                    (Route) => false);
              },
            ),
            SizedBox(
              height: 40,
            ),
            ButtonWidget(
              text: 'Sign Up',
              fun: () async {
                Person objectUser =
                    Person(conName.text, conEmail.text, conPass.text);
                List<Map<String, dynamic>> res =
                    await Services().getEmailUser(objectUser);
                if (conName.text.isEmpty || conName.text.length <= 2) {
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                    backgroundColor: Colors.red,
                    content: const Text(
                        'Please write a name greater than two letters'),
                  ));
                } else if (conEmail.text.isEmpty ||
                    !RegExp(r'^[\w-]+(\.[\w-]+)*@[\w-]+(\.[\w-]+)+$')
                        .hasMatch(conEmail.text)) {
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                    backgroundColor: Colors.red,
                    content: const Text('Please enter a valid email address'),
                  ));
                } else if (conPass.text.isEmpty || conPass.text.length <= 7) {
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                    backgroundColor: Colors.red,
                    content: const Text(
                        'Password must be atleast 8 characters long"'),
                  ));
                } else if (res.isNotEmpty) {
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                    backgroundColor: Colors.red,
                    content: const Text('The user is already registered'),
                  ));
                } else {
                  await Services().insertUserData(objectUser);

                  Timer(Duration(seconds: 1), () {
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                      backgroundColor: Colors.green,
                      content:
                          const Text('You have been registered successfully'),
                    ));
                  });

                  Timer(Duration(seconds: 5), () {
                    Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(builder: (context) => LogInScreen()),
                        (Route) => false);
                  });
                }
              },
            )
          ]),
        ));
  }
}
