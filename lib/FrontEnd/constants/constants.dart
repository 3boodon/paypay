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
  0xff000000,
  0xffffffff,
  0x25000000,
];
List<int> colors1 = [
  0xff50c0fb,
  0xff30D4FF,
  0xff000000,
  0xffffffff,
  0x25000000,
];
List<int> colors2 = [
  0xff1d1e1e,
  0xff505050,
  0xff000000,
  0xffffffff,
  0x25000000,
];
List<int> colors3 = [
  0xffF35044,
  0xffC92C20,
  0xff000000,
  0xffffffff,
  0x25000000,
];
List<int> colors4 = [
  0xff14c99f,
  0xff25dbb1,
  0xff000000,
  0xffffffff,
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
  scaffoldBackgroundColor: kLightTextColor,
);

TextStyle kHeaderTitleTheme = TextStyle(
  height: .3,
  fontWeight: FontWeight.w700,
  color: kDarkTextColor,
  fontFamily: "Poppins",
);
