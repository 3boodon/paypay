import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../constants/constants.dart';

class Setting extends StatelessWidget {
  const Setting({this.title, this.onTap, this.icon});
  final String title;
  final Widget icon;
  final Function onTap;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onTap,
      leading: icon,
      horizontalTitleGap: 2,
      title: AutoSizeText(
        title,
        style: TextStyle(
          fontFamily: Constants.appLanguageCode == "ar" ? "GE_SS" : "Poppins",
          fontSize: Constants.appLanguageCode == "ar" ? 16 : 16,
          fontWeight: FontWeight.normal,
        ),
        maxFontSize: 40,
        maxLines: 1,
      ),
      trailing: Constants.appLanguageCode == "en"
          ? RotationTransition(
              turns: AlwaysStoppedAnimation(180 / 360),
              child: SvgPicture.asset(
                "assets/icons/back_arrow.svg",
                width: MediaQuery.of(context).size.height * 0.01,
              ),
            )
          : RotationTransition(
              turns: AlwaysStoppedAnimation(180 / 90),
              child: SvgPicture.asset(
                "assets/icons/back_arrow.svg",
                // color: kPrimaryColor,
                width: MediaQuery.of(context).size.height * 0.01,
              ),
            ),
    );
  }
}
