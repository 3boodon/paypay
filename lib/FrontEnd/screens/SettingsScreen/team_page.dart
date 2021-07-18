import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_translate/flutter_translate.dart';
import 'package:paypay/FrontEnd/constants/constants.dart';
import 'package:paypay/FrontEnd/responsive/UI/device_data.dart';
import 'package:paypay/FrontEnd/widgets/header.dart';
import 'package:paypay/FrontEnd/widgets/new_page.dart';
import 'package:url_launcher/url_launcher.dart';

class TeamScreen extends StatelessWidget {
  static String routeName = '/TeamScreen';

  const TeamScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return NewPage(
      children: [
        Column(
          children: [
            Header(
              title: translate("ourTeam"),
            ),
            Center(
              child: DeviceData(
                builder: (_, device) => Container(
                    child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    InkWell(
                      splashColor: kPrimaryColor,
                      // highlightColor: kLightTextColor,
                      borderRadius:
                          BorderRadius.circular(device.localWidth * .03),
                      radius: 400,
                      onTap: () async {
                        await launch("https://wa.me/qr/MVXS2MFLWIXCP1");
                      },
                      child: Container(
                        width: device.screenWidth * .7,
                        padding: EdgeInsets.all(kDefaultPadding),
                        margin: EdgeInsets.all(1),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius:
                              BorderRadius.circular(device.localWidth * .03),
                          boxShadow: [
                            BoxShadow(
                              blurRadius: 26,
                              color: Colors.black.withOpacity(.04),
                              offset: Offset(0, 0),
                            ),
                          ],
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            CircleAvatar(
                              child: Image.asset(
                                "assets/images/me.png",
                                fit: BoxFit.cover,
                              ),
                              radius: device.screenWidth * .1,
                            ),
                            SizedBox(height: 3),
                            AutoSizeText(
                              "Abdulrhman Obaid",
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                              maxLines: 1,
                            ),
                            AutoSizeText(
                              "Dart & Flutter Developer\nUI / UX Designer",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 11,
                                color: Colors.blueGrey,
                              ),
                              maxLines: 2,
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(height: device.screenWidth * 0.05),
                    InkWell(
                      splashColor: kPrimaryColor,
                      borderRadius:
                          BorderRadius.circular(device.localWidth * .03),
                      onTap: () async {
                        await launch("https://twitter.com/shahadd_Alharbi");
                      },
                      child: Container(
                        width: device.screenWidth * .7,
                        padding: EdgeInsets.all(kDefaultPadding),
                        margin: EdgeInsets.all(1),
                        decoration: BoxDecoration(
                          borderRadius:
                              BorderRadius.circular(device.localWidth * .03),
                          color: Colors.white,
                          boxShadow: [
                            BoxShadow(
                              blurRadius: 26,
                              color: Colors.black.withOpacity(.04),
                              offset: Offset(0, 0),
                            ),
                          ],
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            CircleAvatar(
                              child: Image.asset("assets/images/s.png"),
                              radius: device.screenWidth * .1,
                            ),
                            SizedBox(height: 3),
                            AutoSizeText(
                              "Shahdd Alharbi",
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                              maxLines: 1,
                            ),
                            AutoSizeText(
                              "Flutter Developer",
                              style: TextStyle(
                                fontSize: 11,
                                color: Colors.blueGrey,
                              ),
                              maxLines: 1,
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(width: device.screenWidth * .1),
                  ],
                )),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
