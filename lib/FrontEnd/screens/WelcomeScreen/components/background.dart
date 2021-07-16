import 'package:flutter/material.dart';
import '../../../../FrontEnd/constants/constants.dart';

class BackgroundOverlay extends StatelessWidget {
  const BackgroundOverlay();
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      color: kDarkTextColor.withOpacity(0.3),
    );
  }
}

class Background extends StatelessWidget {
  const Background();
  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 0,
      child: Image.asset("assets/images/welcomeScreen.jpg", fit: BoxFit.cover),
    );
  }
}
