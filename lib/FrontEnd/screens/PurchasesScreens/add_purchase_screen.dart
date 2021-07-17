import 'package:flutter/material.dart';
import 'package:flutter_translate/flutter_translate.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:intl/intl.dart';
import 'package:paypay/BackEnd/Models/models.dart';
import 'package:paypay/BackEnd/services/buttons_services.dart';
import 'package:paypay/BackEnd/services/models_services.dart';

import 'package:paypay/FrontEnd/responsive/UI/device_data.dart';
import 'package:paypay/FrontEnd/screens/HomeScreen/home_screen.dart';
import 'package:paypay/FrontEnd/widgets/date.dart';

import 'package:paypay/FrontEnd/widgets/header.dart';
import 'package:paypay/FrontEnd/widgets/plus_icon.dart';
import '../../constants/constants.dart';
import '../../widgets/buttons.dart';
import '../../widgets/input.dart';

import '../../widgets/new_page.dart';

class NewPurchaseScreen extends StatefulWidget {
  static String routeName = '/NewPurchaseScreen';

  @override
  _NewPurchaseScreenState createState() => _NewPurchaseScreenState();
}

class _NewPurchaseScreenState extends State<NewPurchaseScreen> {
  final _formKey = GlobalKey<FormState>();

  TextEditingController _purchasesNameController = TextEditingController();

  TextEditingController _priceController = TextEditingController();

  TextEditingController _dateFieldController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return DeviceData(
      builder: (context, device) => NewPage(
        children: [
          Header(
            date: Hive.box(userDataBoxName).get(userDataKeyName)["signUpDate"],
            title: translate("purchases"),
          ),
          Expanded(
            flex: 10,
            child: Container(
              child: Center(
                child: Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      const Spacer(),
                      Input(
                        validator: (value) {
                          if (value.isEmpty) {
                            return translate("please_enter_aname");
                          }
                          return null;
                        },
                        controller: _purchasesNameController,
                        placeHolder: translate("purchase_name"),
                        width: device.screenWidth * .6,
                        type: TextInputType.text,
                      ),
                      Input(
                        validator: (value) {
                          if (value.isEmpty) {
                            return translate("please_enter_aprice");
                          }
                          return null;
                        },
                        controller: _priceController,
                        placeHolder: translate("price"),
                        width: device.screenWidth * .6,
                        type: TextInputType.number,
                      ),
                      DateTimePicker(
                        placeholder: translate("date"),
                        width: device.screenWidth * .6,
                        dateController: _dateFieldController,
                      ),
                      Button(
                        width: device.screenWidth * .6,
                        text: translate("add"),
                        onPressed: () => addNewPurchse(
                            price: _priceController,
                            date: _dateFieldController,
                            purchaseName: _purchasesNameController),
                      ),
                      const Spacer(),
                    ],
                  ),
                ),
              ),
            ),
          ),
          SizedBox(
            width: device.screenWidth * .17,
            height: device.screenWidth * .13,
            child: LayoutBuilder(
              builder: (context, cons) => PlusIcon(
                color: kDarkTextColor,
                width: cons.maxWidth,
                height: 19,
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.all(12),
            child: Center(
              child: Text(
                translate("new_purchases"),
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontFamily:
                      Constants.appLanguageCode == "ar" ? "GE_SS" : "Poppins",
                  fontSize: device.screenWidth * .07,
                  color: kDarkTextColor,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          const Spacer(
            flex: 1,
          ),
        ],
      ),
    );
  }
}
