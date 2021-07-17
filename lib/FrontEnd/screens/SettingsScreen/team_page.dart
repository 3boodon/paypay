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
            SizedBox(
              height: 50,
            ),
            Center(
              child: DeviceData(
                builder: (_, device) => Container(
                    child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    InkWell(
                      splashColor: kPrimaryColor,
                      highlightColor: kPrimaryLightColor,
                      onTap: () async {
                        await launch("https://wa.me/qr/MVXS2MFLWIXCP1");
                      },
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          AutoSizeText(
                            "Abdulrhman Obaid",
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                            maxLines: 1,
                          ),
                          AutoSizeText(
                            "UI / UX Designer & Flutter Developer",
                            style: TextStyle(
                              fontSize: 11,
                              color: Colors.blueGrey,
                            ),
                            maxLines: 1,
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: device.screenWidth * 0.10),
                    InkWell(
                      onTap: () async {
                        await launch("https://twitter.com/shahadd_Alharbi");
                      },
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
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
