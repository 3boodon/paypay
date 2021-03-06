/// Packages & Libraries

import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_translate/flutter_translate.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:paypay/BackEnd/controller/home_controller.dart';
import 'package:paypay/BackEnd/services/models_services.dart';
import 'package:paypay/BackEnd/Models/models.dart';
import 'package:paypay/FrontEnd/constants/useful_functions.dart';
import 'package:paypay/FrontEnd/screens/HomeScreen/home_screen.dart';
import 'package:paypay/FrontEnd/widgets/AppLists/dropDownInput.dart';

/// Local Files Import
import '../../../../FrontEnd/constants/constants.dart';

import '../../../../FrontEnd/responsive/UI/device_data.dart';
import '../../../../FrontEnd/widgets/buttons.dart';
import '../../../../FrontEnd/widgets/input.dart';

class SignUpForm extends StatefulWidget {
  @override
  _SignUpFormState createState() => _SignUpFormState();
}

class _SignUpFormState extends State<SignUpForm> {
  HomeController h = Get.put(HomeController());
  Widget build(BuildContext context) {
    TextEditingController _nameController = TextEditingController();
    TextEditingController _budgetController = TextEditingController();

    final GlobalKey<FormState> _formKey = GlobalKey();

    return DeviceData(builder: (context, device) {
      return Container(
        child: Center(
          child: Container(
            width: device.screenWidth * .65,
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  // The Title of The Form
                  AutoSizeText(
                    translate("register"),
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: kDarkTextColor,
                        fontSize: 30,
                        fontFamily: "GE_SS",
                        fontWeight: FontWeight.w700),
                    maxLines: 1,
                  ),
                  const SizedBox(
                    height: 20,
                  ), // adds some space
                  Input(
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your name';
                      }
                      return null;
                    },
                    controller: _nameController,
                    // alignLeft: true,
                    type: TextInputType.text,
                    placeHolder: translate("write_your_name"),
                  ),
                  SizedBox(
                    // width: 313,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        /// Budget Input
                        Input(
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter your budget';
                            }
                            return null;
                          },
                          isSignUp: true,
                          controller: _budgetController,
                          // alignLeft: true,
                          width: (device.screenWidth * .65) / 2.1,
                          type: TextInputType.number,
                          placeHolder: translate("budget"),
                        ),

                        //Currency DropDown
                        Obx(
                          () => DropDownInput(
                            validator: (value) =>
                                value == null ? 'currency is required' : null,
                            width: (device.screenWidth * .65) / 2.1,
                            hint: "curreny",
                            value: h.currency.value,
                            onChange: (String selectedCurrency) {
                              h.changeCurrency(selectedCurrency);
                            },
                            options: [
                              'SR',
                              'YR',
                              r'$',
                              'EGP',
                              'INR',
                              'EUR',
                              'MYR',
                              'SGD',
                              'PHP',
                              'IDR'
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),

                  Button(
                      text: translate("sign_up"),
                      onPressed: () async {
                        if (_formKey.currentState.validate()) {
                          UserData data = UserData()
                            ..name = _nameController.text
                            ..budget = double.parse(_budgetController.text)
                            ..currency = h.currency.value
                            ..signUpDate = smartDate(DateTime.now())
                            ..loggedIn = true;

                          ModelsService().saveUserDataToHive(data);
                          var box = await Hive.openBox(userDataBoxName);
                          var dataFromHive =
                              UserData.fromJSON(box.get(userDataKeyName));

                          h.lastUpdateDate.value = dataFromHive.signUpDate;
                          Get.offAllNamed(HomeScreen.routeName);
                        }
                      }),
                ],
              ),
            ),
          ),
        ),
      );
    });
  }
}
