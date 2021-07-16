import 'package:flutter/material.dart';
import 'package:paypay/FrontEnd/widgets/new_page.dart';
import 'components/sign_in_form.dart';

class SignInScreen extends StatefulWidget {
  // This is the Route Name that We Are going to use whenever we need to navigate to this page
  static const String routeName = '/SignInScreen';

  @override
  _SignInScreenState createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  @override
  Widget build(BuildContext context) {
    return NewPage(
      children: [
        Spacer(),
        const SignInForm(),
        Spacer(),
      ],
    );
  }
}
