import 'package:flutter/material.dart';
import 'package:paypay/FrontEnd/responsive/UI/device_data.dart';
import '../../constants/constants.dart';
import './components/background.dart';
import './components/welcome_screen_buttons.dart';
import './components/welcome_text.dart';

class WelcomeScreen extends StatelessWidget {
  // This is the Route Name that We Are going to use whenever we need to navigate to this page
  static const String routeName = '/WelcomeScreen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: DeviceData(
        builder: (_, device) => Container(
          width: device.screenWidth,
          height: device.screenHeight,
          color: kPrimaryColor,
          child: Stack(
            children: [
              const Background(),
              const BackgroundOverlay(),
              Container(
                width: device.screenWidth,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Spacer(),
                    Container(
                        width: device.localWidth * .65,
                        child: WelcomeScreenText()),
                    Spacer(
                      flex: 5,
                    ),
                    Container(
                      width: device.localWidth * .65,
                      child: WelcomeScreenButtons(
                        height: device.screenWidth * .17,
                      ),
                    ),
                    Spacer(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
