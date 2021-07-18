import 'package:flutter/material.dart';
import 'package:flutter_translate/flutter_translate.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:paypay/BackEnd/Models/models.dart';
import 'package:paypay/BackEnd/controller/home_controller.dart';
import 'package:paypay/BackEnd/services/models_services.dart';
import 'package:paypay/FrontEnd/constants/constants.dart';
import 'package:paypay/FrontEnd/responsive/UI/device_data.dart';
import 'package:paypay/FrontEnd/screens/HomeScreen/home_screen.dart';
import 'package:paypay/FrontEnd/widgets/buttons.dart';
import 'package:paypay/FrontEnd/widgets/header.dart';
import 'package:paypay/FrontEnd/widgets/new_page.dart';

class Profile extends StatelessWidget {
  // This is the Route Name that We Are going to use whenever we need to navigate to this page
  static String routeName = '/Profile';
  Profile();
  HomeController h = Get.put(HomeController());
  String _userName;
  double _newBudget;
  @override
  Widget build(BuildContext context) {
    /// Get an instance of the stored user data
    UserData userData = UserData.fromJSON(Map<String, dynamic>.from(
        Hive.box(userDataBoxName).get(userDataKeyName)));
    return DeviceData(
        builder: (context, device) => NewPage(children: [
              Header(
                title: translate("edit_info"),
                date: null,
              ),
              Container(
                child: Center(
                  child: Container(
                    width: device.screenWidth * .65,
                    child: Column(
                      children: [
                        TextFormField(
                          keyboardType: TextInputType.text,
                          enableSuggestions: true,
                          onChanged: (value) {
                            _userName = value;
                          },
                          cursorColor: kDarkTextColor,
                          initialValue: userData.name,
                          decoration: InputDecoration(
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: kPrimaryColor),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: kPrimaryColor),
                            ),
                            border: OutlineInputBorder(),
                            labelStyle: TextStyle(color: kDarkTextColor),
                            labelText: translate("edit_your_name"),
                          ),
                        ),
                        SizedBox(height: device.localHeight * .02),
                        TextFormField(
                          keyboardType: TextInputType.number,
                          onChanged: (value) {
                            _newBudget = double.parse(value) ?? userData.budget;
                          },
                          initialValue: "${userData.budget}",
                          cursorColor: kDarkTextColor,
                          decoration: InputDecoration(
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: kPrimaryColor),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: kPrimaryColor),
                            ),
                            border: OutlineInputBorder(),
                            labelStyle: TextStyle(color: kDarkTextColor),
                            labelText: translate("edit_your_budget"),
                          ),
                        ),
                        SizedBox(height: device.localHeight * .02),
                        Button(
                            text: translate("save"),
                            onPressed: () async {
                              /// Get an instance of the stored user data
                              UserData s = UserData.fromJSON(
                                  Map<String, dynamic>.from(
                                      Hive.box(userDataBoxName)
                                          .get(userDataKeyName)));

                              String newName = _userName ?? userData.name;
                              double newValue = _newBudget ?? userData.budget;

                              s
                                ..name = newName
                                ..budget = newValue;

                              ModelsService().saveUserDataToHive(s);

                              Get.offAllNamed(HomeScreen.routeName);
                            }),
                        SizedBox(height: device.localHeight * .02),
                        Button(
                            text: translate("changePic"),
                            color: kPrimaryLightColor,
                            onPressed: () async {
                              /// Get an instance of the stored user data
                              UserData s = UserData.fromJSON(
                                  Map<String, dynamic>.from(
                                      Hive.box(userDataBoxName)
                                          .get(userDataKeyName)));

                              s.picture == "maleuser.png"
                                  ? s.picture = "femaleuser.png"
                                  : s.picture = "maleuser.png";

                              ModelsService().saveUserDataToHive(s);
                              Get.offAllNamed(HomeScreen.routeName);
                            }),
                      ],
                    ),
                  ),
                ),
              ),
              Spacer(),
            ]));
  }
}
