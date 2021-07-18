import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:paypay/BackEnd/Models/models.dart';
import 'package:paypay/BackEnd/services/models_services.dart';

// Default Padding
const double kDefaultPadding = 30;

getColors() async {
  var hi = await Hive.box(userDataBoxName).get(userDataKeyName);
  UserData s = UserData.fromJSON(Map<String, dynamic>.from(hi));
  colors = s.colors;
  print("hiiiiiiiiiiiiiiiiiiiiiiiiiiiiiii colooooooooooooooor success ");
}

List<int> colors = [
  0xff50c0fb,
  0xff30D4FF,
  0xff273146,
  0xffffffff,
  0x25000000,
];
List<int> colors1 = [
  0xff7150CE,
  0xff8E6FE4,
  0xff273146,
  0xffF1F1F1,
  0x25000000,
];
List<int> colors2 = [
  0xff50A6FB,
  0xff30D4FF,
  0xff273146,
  0xffffffff,
  0x25000000,
];
List<int> colors3 = [
  0xff14c99f,
  0xff25dbb1,
  0xff273146,
  0xffffffff,
  0x25000000,
];
List<int> colors4 = [
  0xff2BC6C7,
  0xff2ED6D6,
  0xff000000,
  0xffffffff,
  0x25000000,
];
List<int> colors5 = [
  0xffE1D3D3,
  0xffECE0E0,
  0xff4D4D4D,
  0xffFeFeFe,
  0x25000000,
];
List<int> colors6 = [
  0xff273146,
  0xff2B374E,
  0xff273146,
  0xffE6E5E3,
  0x25000000,
];

// Colors
Color kPrimaryColor = Color(colors[0]); // This is the main Color of the App
Color kPrimaryLightColor =
    Color(colors[1]); // This is the main Color of the App
Color kDarkTextColor = Color(colors[2]); // This the default Text Color
Color kLightTextColor = Color(colors[3]); // This is For Card's Text Color
Color kInActiveTextColor =
    Color(colors[4]); // This is For In Active Form Text Color

// TextStyles
TextStyle kHeaderTitleStyle = TextStyle(
  color: kDarkTextColor,
  fontWeight: FontWeight.w900,
  fontSize: 30,
);

ThemeData kTheme = ThemeData(
  fontFamily: "Poppins", // this is gonna be the default font for the App
  scaffoldBackgroundColor: Colors.white,
  // primarySwatch: kPrimaryColor,
);

TextStyle kHeaderTitleTheme = TextStyle(
  height: .3,
  fontWeight: FontWeight.w700,
  color: kDarkTextColor,
  fontFamily: "Poppins",
);

class Constants {
  static String appLanguageCode;
}
