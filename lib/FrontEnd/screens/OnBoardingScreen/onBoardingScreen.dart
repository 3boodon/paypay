import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_translate/flutter_translate.dart';
import 'package:get/get.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:paypay/FrontEnd/screens/HomeScreen/home_screen.dart';
import 'package:paypay/FrontEnd/screens/WelcomeScreen/welcome_screen.dart';

class OnBoardingScreen extends StatelessWidget {
  static String routeName = '/OnBoardingScreen';
  const OnBoardingScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: IntroductionScreen(
        done: Text(
          "${translate("continue")}",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        onDone: () => Get.toNamed(WelcomeScreen.routeName),
        pages: [
          PageViewModel(
              title: "Easly organized",
              body: translate("organize_your_financial_life_more"),
              //image: buildImage('assets/images/imageName')
              decoration: getPageDecoration()),
          PageViewModel(
              title: "Many features to make your life easier",
              body: translate("record_your_daily_expenses_easily"),
              //image: buildImage('assets/images/imageName')
              decoration: getPageDecoration()),
          PageViewModel(
              title: "User Friendly",
              body: translate("did_you_make_a_mistake_in_the_addition"),
              //image: buildImage('assets/images/imageName')
              decoration: getPageDecoration()),
        ],
        showSkipButton: true,
        skip: Text(translate('skip')),
        next: Icon(Icons.arrow_forward),
        dotsDecorator: getDotDecoration(),
        onChange: (index) => print('Page $index selected'),
        globalBackgroundColor: Theme.of(context).primaryColor,
        skipFlex: 0,
        nextFlex: 0,
        onSkip: () => Get.toNamed(WelcomeScreen.routeName),
      ),
    );
  }

  Widget buildImage(String path) {
    return Center(
      child: Image.asset(
        path,
        width: 350,
      ),
    );
  }

  DotsDecorator getDotDecoration() => DotsDecorator(
        color: Color(0xFFBDBDBD),
        //activeColor: Colors.orange,
        size: Size(10, 10),
        activeSize: Size(22, 10),
        activeShape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(24),
        ),
      );

  PageDecoration getPageDecoration() => PageDecoration(
        titleTextStyle: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
        bodyTextStyle: TextStyle(fontSize: 20),
        descriptionPadding: EdgeInsets.all(16).copyWith(bottom: 0),
        imagePadding: EdgeInsets.all(24),
        pageColor: Colors.white,
      );
}
