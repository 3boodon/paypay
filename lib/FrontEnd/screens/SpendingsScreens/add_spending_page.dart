import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:intl/intl.dart';
import 'package:paypay/BackEnd/services/buttons_services.dart';
import 'package:paypay/BackEnd/services/models_services.dart';
import 'package:paypay/BackEnd/Models/models.dart';
import 'package:paypay/FrontEnd/constants/constants.dart';
import 'package:paypay/FrontEnd/responsive/UI/device_data.dart';
import 'package:paypay/FrontEnd/screens/HomeScreen/home_screen.dart';
import 'package:paypay/FrontEnd/widgets/buttons.dart';
import 'package:paypay/FrontEnd/widgets/date.dart';
import 'package:paypay/FrontEnd/widgets/header.dart';
import 'package:paypay/FrontEnd/widgets/input.dart';
import 'package:paypay/FrontEnd/widgets/plus_icon.dart';
import '../../../FrontEnd/widgets/new_page.dart';

class NewSpendingScreen extends StatefulWidget {
  // This is the Route Name that We Are going to use whenever we need to navigate to this page
  static String routeName = '/NewSpendingScreen';

  @override
  _NewSpendingScreenState createState() => _NewSpendingScreenState();
}

class _NewSpendingScreenState extends State<NewSpendingScreen> {
  @override
  Widget build(BuildContext context) {
    final _formKey = GlobalKey<FormState>();

    final _spendingsNameController = TextEditingController();
    final _priceController = TextEditingController();
    final _dateFieldController = TextEditingController();

    return DeviceData(
      builder: (context, device) => NewPage(
        children: [
          Header(
            date: Hive.box(userDataBoxName).get(userDataKeyName)["signUpDate"],
            title: "Spendings",
          ),
          Expanded(
            flex: 10,
            child: Container(
              child: Center(
                child: Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      Spacer(),
                      Input(
                        validator: (value) {
                          if (value.isEmpty) {
                            return 'Please enter a name';
                          }
                          return null;
                        },
                        controller: _spendingsNameController,
                        placeHolder: "Spending Name",
                        width: device.screenWidth * .6,
                        type: TextInputType.text,
                      ),
                      Input(
                        validator: (value) {
                          if (value.isEmpty) {
                            return 'Please enter a price';
                          }
                          return null;
                        },
                        controller: _priceController,
                        placeHolder: "price",
                        width: device.screenWidth * .6,
                        type: TextInputType.number,
                      ),
                      DateTimePicker(
                        placeholder: "date",
                        width: device.screenWidth * .6,
                        dateController: _dateFieldController,
                      ),
                      Button(
                          width: device.screenWidth * .6,
                          text: "Add",
                          onPressed: () => addNewSpending(
                              spendingName: _spendingsNameController,
                              date: _dateFieldController,
                              price: _priceController)),
                      Spacer(),
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
                "New Spending",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: device.screenWidth * .07,
                  color: kDarkTextColor,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          Spacer(
            flex: 1,
          ),
        ],
      ),
    );
  }
}
