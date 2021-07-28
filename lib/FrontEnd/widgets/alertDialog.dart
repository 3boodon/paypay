import 'package:flutter/material.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

import '../constants/constants.dart';

showAlertDialog(errorMsg, BuildContext context) {
  return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text(
            'Login Failed',
            style: TextStyle(
              color: Colors.black,
              fontFamily:
                  Constants.appLanguageCode == "ar" ? "GE_SS" : "Poppins",
            ),
          ),
          content: Text(errorMsg),
        );
      });
}

showAlertDialogWithActions(message, BuildContext context) {
  return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          actions: <Widget>[
            TextButton(
                onPressed: () {
                  Navigator.pushReplacementNamed(context, '/SignInScreen');
                },
                child: Text('Ok'))
          ],
          title: Text(
            'Welcome!',
            style: TextStyle(
              color: Colors.black,
              fontFamily:
                  Constants.appLanguageCode == "ar" ? "GE_SS" : "Poppins",
            ),
          ),
          content: Text(message),
        );
      });
}

onDeleteButtonPressed({
  BuildContext context,
  String title,
  String desc,
  AlertType type,
  String confirmButtonText,
  String cancelButtonText,
  Function deleteTap,
  Function cancelTap,
}) {
  Alert(context: context, type: type, title: title, desc: desc, buttons: [
    DialogButton(
      color: kPrimaryColor,
      onPressed: deleteTap,
      child: Text(
        confirmButtonText,
        style: TextStyle(color: Colors.white, fontSize: 20),
      ),
    ),
    DialogButton(
      color: kPrimaryColor,
      onPressed: cancelTap,
      child: Text(
        cancelButtonText,
        style: TextStyle(color: Colors.white, fontSize: 20),
      ),
    )
  ]).show();
}
