import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:intl/intl.dart';
import 'package:paypay/BackEnd/Models/models.dart';
import 'package:paypay/BackEnd/controller/home_controller.dart';
import 'package:paypay/BackEnd/services/models_services.dart';
import 'package:paypay/FrontEnd/constants/constants.dart';
import 'package:paypay/FrontEnd/responsive/UI/device_data.dart';
import 'package:paypay/FrontEnd/screens/HomeScreen/home_screen.dart';
import 'package:paypay/FrontEnd/widgets/AppLists/dropDownInput.dart';
import 'package:paypay/FrontEnd/widgets/buttons.dart';
import 'package:paypay/FrontEnd/widgets/header.dart';
import 'package:paypay/FrontEnd/widgets/input.dart';
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
                title: 'Edit Info',
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
                          initialValue: userData.name,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: "Edit your name",
                          ),
                        ),
                        SizedBox(height: device.localHeight * .02),
                        TextFormField(
                          keyboardType: TextInputType.number,
                          onChanged: (value) {
                            _newBudget = double.parse(value) ?? userData.budget;
                          },
                          initialValue: "${userData.budget}",
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: "Edit Your Budget",
                          ),
                        ),
                        SizedBox(height: device.localHeight * .02),
                        Button(
                            text: "Save",
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
                      ],
                    ),
                  ),
                ),
              ),
              Spacer(),
            ]));
  }
}
