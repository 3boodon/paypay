import 'package:flutter/material.dart';
import 'package:flutter_translate/flutter_translate.dart';

import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:paypay/BackEnd/Models/models.dart';
import 'package:paypay/BackEnd/services/models_services.dart';
import 'package:paypay/FrontEnd/constants/constants.dart';

import 'package:paypay/FrontEnd/responsive/UI/device_data.dart';
import 'package:paypay/FrontEnd/screens/SettingsScreen/about_page.dart';
import 'package:paypay/FrontEnd/screens/SettingsScreen/change_colors.dart';
import 'package:paypay/FrontEnd/screens/SettingsScreen/profile.dart';
import 'package:paypay/FrontEnd/screens/SettingsScreen/reset_page.dart';

import 'package:paypay/FrontEnd/screens/SettingsScreen/team_page.dart';

import 'package:paypay/FrontEnd/widgets/header.dart';
import 'package:paypay/FrontEnd/widgets/setting_tile.dart';

import '../../widgets/new_page.dart';

class SettingsScreen extends StatelessWidget {
  // This is the Route Name that We Are going to use whenever we need to navigate to this page
  static String routeName = '/SettingsScreen';

  @override
  Widget build(BuildContext context) {
    return NewPage(
      children: [
        Header(
          title: translate("settings"),
          date: null,
        ),
        SizedBox(
          height: 40,
        ),
        Expanded(
          flex: 12,
          child: DeviceData(
            builder: (_, device) => Container(
              child: ListView(
                physics: BouncingScrollPhysics(),
                children: [
                  Setting(
                    title: translate("profile"),
                    onTap: () => Get.toNamed(Profile.routeName),
                  ),
                  Setting(
                    title: translate("aboutTheApp"),
                    onTap: () => Get.toNamed(AboutScreen.routeName),
                  ),
                  Setting(
                    title: translate("ourTeam"),
                    onTap: () => Get.toNamed(TeamScreen.routeName),
                  ),
                  Setting(
                    title: translate("change_color_theme"),
                    onTap: () async {
                      Get.toNamed(ChangeColorScreen.routeName);
                    },
                  ),
                  Setting(
                    title: translate("share_paypay"),
                    onTap: () => null,
                  ),
                  Setting(
                    title: translate("change_language"),
                    onTap: () => null,
                  ),
                  Setting(
                    title: translate("resetData"),
                    onTap: () => Get.toNamed(ResetPage.routeName),
                  ),
                ],
              ),
            ),
          ),
        ),

        Spacer(
          flex: 1,
        ), // This adds some space at the bottom of the screen
      ],
    );
  }
}
