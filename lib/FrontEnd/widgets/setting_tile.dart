import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../constants/constants.dart';

class Setting extends StatelessWidget {
  const Setting({this.title, this.onTap});
  final String title;
  final Function onTap;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onTap,
      title: AutoSizeText(
        title,
        style: TextStyle(
          fontFamily: Constants.appLanguageCode == "ar" ? "GE_SS" : "Poppins",
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
        maxFontSize: 40,
        maxLines: 1,
      ),
      trailing: RotationTransition(
        turns: AlwaysStoppedAnimation(180 / 360),
        child: SvgPicture.asset(
          "assets/icons/back_arrow.svg",
          width: MediaQuery.of(context).size.height * 0.012,
        ),
      ),
    );
  }
}
