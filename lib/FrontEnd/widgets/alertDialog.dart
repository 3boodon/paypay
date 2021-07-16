import 'package:flutter/material.dart';

showAlertDialog(errorMsg, BuildContext context) {
  return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text(
            'Login Failed',
            style: TextStyle(color: Colors.black),
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
            style: TextStyle(color: Colors.black),
          ),
          content: Text(message),
        );
      });
}
