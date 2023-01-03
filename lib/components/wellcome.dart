import 'package:flutter/material.dart';
import 'package:giasu_app/components/registed.dart';
import 'package:giasu_app/constants/constants.dart';

import 'login.dart';

class Wellcome extends StatelessWidget {
  const Wellcome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
          width: size.width,
          height: double.infinity,
          child: Stack(
            alignment: Alignment.center,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    TitleConstants.wellcomeTitle,
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                  ),
                  SizedBox(height: size.height * 0.08),
                  Image.asset("assets/images/teamwork.jpg", width: size.width),
                  SizedBox(height: size.height * 0.1),
                  RoudedButton(
                    size: size,
                    color: ColorConstants.kPrimaryColor,
                    textColor: ColorConstants.kTextButtonColor,
                    title: ButtonConstants.login,
                    press: () => Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Login()),
                    ),
                  ),
                  SizedBox(height: size.height * 0.02),
                  RoudedButton(
                    size: size,
                    color: Colors.red,
                    textColor: Colors.white,
                    title: ButtonConstants.registed,
                    press: () => Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Registed()),
                    ),
                  ),
                ],
              )
            ],
          )),
    );
  }
}

class RoudedButton extends StatelessWidget {
  const RoudedButton({
    Key? key,
    required this.size,
    required this.press,
    required this.title,
    required this.color,
    required this.textColor,
  }) : super(key: key);

  final Size size;
  final Function press;
  final String title;
  final Color color, textColor;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        width: size.width * 0.8,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(30),
          child: ElevatedButton(
            onPressed: () => press(),
            // padding: EdgeInsets.symmetric(vertical: 15, horizontal: 40),
            // color: color,
            child: Text(
              title,
              style: TextStyle(color: textColor, fontSize: 18),
            ),
          ),
        ),
      ),
    );
  }
}
