import 'package:flutter/material.dart';
import 'package:paypay/FrontEnd/responsive/UI/device_data.dart';

//Later we add this page
class ShareAppScreen extends StatelessWidget {
  static String routeName = '/ShareAppScreen';

  const ShareAppScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DeviceData(
      builder: (_, device) => Container(
        child: Column(),
      ),
    );
  }
}
