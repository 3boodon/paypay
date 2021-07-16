import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:paypay/FrontEnd/screens/HomeScreen/home_screen.dart';

import 'package:flutter_svg/flutter_svg.dart';

import '../../../../FrontEnd/responsive/UI/device_data.dart';
import '../../../../FrontEnd/constants/constants.dart';
import '../../../../FrontEnd/widgets/buttons.dart';
import '../../../../FrontEnd/widgets/input.dart';

class SignInForm extends StatefulWidget {
  const SignInForm();

  @override
  _SignInFormState createState() => _SignInFormState();
}

class _SignInFormState extends State<SignInForm> {
  @override
  Widget build(BuildContext context) {
    final TextEditingController emailController = TextEditingController();
    final TextEditingController passwordController = TextEditingController();
    final GlobalKey<FormState> _formKey = GlobalKey();

    return DeviceData(
      builder: (_, device) => Container(
        child: Center(
          child: SizedBox(
            width: device.screenWidth * .65,
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  Text(
                    "Welcome\nBack!",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: kDarkTextColor,
                        fontSize: device.screenWidth * .1,
                        fontWeight: FontWeight.w700),
                  ),
                  // Spacer(),
                  Padding(
                    padding: EdgeInsets.symmetric(
                        vertical: device.screenWidth * .05),
                    child: SvgPicture.asset(
                      "assets/icons/SignInPage.svg",
                      width: device.screenWidth * .4,
                    ),
                  ),
                  // Spacer(),
                  Input(
                    controller: emailController,
                    alignLeft: true,
                    type: TextInputType.emailAddress,
                    placeHolder: "Enter Your Email",
                  ),
                  Input(
                    controller: passwordController,
                    alignLeft: true,
                    type: TextInputType.visiblePassword,
                    placeHolder: "Password",
                  ),
                  SizedBox(
                    height: 20,
                  ),

                  Padding(
                    padding: EdgeInsets.only(bottom: device.screenWidth * .05),
                    child: Text("Forgot Password ..."),
                  ),
                  Button(
                      text: "SignIn",
                      onPressed: () {
                        Get.offNamed(HomeScreen.routeName);
                      })
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
