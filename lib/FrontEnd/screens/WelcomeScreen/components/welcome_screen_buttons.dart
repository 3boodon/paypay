import 'package:flutter/material.dart';
import 'package:flutter_translate/flutter_translate.dart';
import 'package:get/get.dart';
import 'package:paypay/FrontEnd/screens/AuthScreens/sign_up_screen.dart';
import '../../../../FrontEnd/widgets/buttons.dart';

class WelcomeScreenButtons extends StatelessWidget {
  const WelcomeScreenButtons({@required this.height});
  final double height;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      child: Column(
        children: [
          Button(
            text: translate("procced_to_app"),
            onPressed: () => Get.offNamed(SignUpScreen.routeName),
          ),
        ],
      ),
    );
  }
}
