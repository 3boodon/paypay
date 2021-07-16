import 'package:flutter/material.dart';
import '../../widgets/new_page.dart';
import './components/sign_up_form.dart';

class SignUpScreen extends StatelessWidget {
  // This is the Route Name that We Are going to use whenever we need to navigate to this page
  static String routeName = '/SignUpScreen';
  @override
  Widget build(BuildContext context) {
    return NewPage(children: [
      const Spacer(),
      SignUpForm(),
      const Spacer(),
    ]);
  }
}
