import 'package:flutter/material.dart';
import 'package:paypay/FrontEnd/responsive/UI/device_data.dart';
import '../constants/constants.dart';

class NewPage extends StatelessWidget {
  final List<Widget> children;
  const NewPage({@required this.children});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: kDefaultPadding,
          ),
          child: DeviceData(
            builder: (ctx, deviceInfo) => SingleChildScrollView(
              physics: BouncingScrollPhysics(),
              clipBehavior: Clip.antiAliasWithSaveLayer,
              child: Container(
                height: deviceInfo.screenHeight -
                    MediaQuery.of(context).padding.top,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: children,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
