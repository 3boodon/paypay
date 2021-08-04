import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_translate/flutter_translate.dart';
import 'package:get/get.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:paypay/FrontEnd/constants/constants.dart';
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
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontFamily: Constants.appLanguageCode == "ar" ? "GE_SS" : "Poppins",
          ),
        ),
        onDone: () => Get.toNamed(WelcomeScreen.routeName),
        pages: [
          PageViewModel(
              titleWidget: buildTitle("easly_orgnized"),
              image: buildImage('assets/icons/easly_organized.svg'),
              bodyWidget: buildDescription("organize_your_financial_life_more"),
              decoration: getPageDecoration()),
          PageViewModel(
              titleWidget: buildTitle("review_your_financial_record"),
              image: buildImage('assets/icons/review_of_financial_record.svg'),
              bodyWidget: buildDescription("view_all_your_recorded_expenses"),
              decoration: getPageDecoration()),
          PageViewModel(
              titleWidget: buildTitle("many_features"),
              image: buildImage('assets/icons/many_features.svg'),
              bodyWidget: buildDescription("record_your_daily_expenses_easily"),
              decoration: getPageDecoration()),
          PageViewModel(
              titleWidget: buildTitle("user_friendly"),
              image: buildImage('assets/icons/user_friendly.svg'),
              bodyWidget:
                  buildDescription("did_you_make_a_mistake_in_the_addition"),
              decoration: getPageDecoration()),
        ],
        showSkipButton: true,
        skip: Text(
          translate('skip'),
          style: TextStyle(
            fontFamily: Constants.appLanguageCode == "ar" ? "GE_SS" : "Poppins",
          ),
        ),
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
      child: SvgPicture.asset(
        path,
        width: 350,
      ),
    );
  }

  Widget buildTitle(String title) {
    return Text(
      translate("$title"),
      textAlign: TextAlign.center,
      style: TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: Constants.appLanguageCode == "ar" ? 30 : 25,
        fontFamily: Constants.appLanguageCode == "ar" ? "GE_SS" : "Poppins",
      ),
    );
  }

  Widget buildDescription(String description) {
    return Text(
      translate("$description"),
      textAlign: TextAlign.center,
      style: TextStyle(
        fontWeight: FontWeight.normal,
        fontSize: Constants.appLanguageCode == "ar" ? 20 : 20,
        fontFamily: Constants.appLanguageCode == "ar" ? "GE_SS" : "Poppins",
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
        titlePadding: EdgeInsets.only(bottom: 10),
        descriptionPadding: EdgeInsets.only(top: 10),
        imagePadding: EdgeInsets.all(24),
        pageColor: Colors.white,
      );
}
