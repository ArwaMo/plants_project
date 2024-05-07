// ignore_for_file: prefer_const_constructors, non_constant_identifier_names, avoid_types_as_parameter_names

import 'package:final_project/screens/log_in_screen.dart';
import 'package:final_project/screens/sign_up_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/widgets.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(children: [
              Opacity(
                opacity: 0.9,
                child: Image.asset(
                  'assets/background_plant.png',
                  fit: BoxFit.cover,
                  width: double.infinity,
                ),
              ),
              Positioned(
                top: 130,
                left: 20,
                child: Text(
                  //  The best application to know plants
                  'THE BEST \nAPPLICATION \nTO KNOW \nPLANTS ',
                  style: TextStyle(color: Color(0xffFBFBFB), fontSize: 50),
                ),
              ),
              Positioned(
                  top: 650,
                  left: 50,
                  child: SizedBox(
                    width: 300,
                    child: ElevatedButton(
                        style: ElevatedButton.styleFrom(),
                        onPressed: () {
                          Navigator.pushAndRemoveUntil(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => SignUpScreen()),
                              (Route) => false);
                        },
                        child: Text(
                          'Start',
                          style: TextStyle(color: Color(0xff3C6255)),
                        )),
                  )),
            ]),
          ],
        ),
      ),
    );
  }
}
