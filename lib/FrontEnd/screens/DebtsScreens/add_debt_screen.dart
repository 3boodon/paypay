import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:intl/intl.dart';
import 'package:paypay/BackEnd/services/buttons_services.dart';
import 'package:paypay/BackEnd/services/models_services.dart';
import 'package:paypay/BackEnd/Models/models.dart';
import 'package:paypay/FrontEnd/responsive/UI/device_data.dart';
import 'package:paypay/FrontEnd/screens/HomeScreen/home_screen.dart';
import 'package:paypay/FrontEnd/widgets/date.dart';

import 'package:paypay/FrontEnd/widgets/header.dart';
import 'package:paypay/FrontEnd/widgets/plus_icon.dart';
import '../../../FrontEnd/constants/constants.dart';
import '../../../FrontEnd/widgets/buttons.dart';
import '../../../FrontEnd/widgets/input.dart';

import '../../../FrontEnd/widgets/new_page.dart';

class NewDebtScreen extends StatefulWidget {
  // This is the Route Name that We Are going to use whenever we need to navigate to this page
  static String routeName = '/NewDebtScreen';

  @override
  _NewDebtScreenState createState() => _NewDebtScreenState();
}

class _NewDebtScreenState extends State<NewDebtScreen> {
  @override
  Widget build(BuildContext context) {
    final _formKey = GlobalKey<FormState>();

    final _ownerName = TextEditingController();
    final _debtController = TextEditingController();
    final _debtDateController = TextEditingController();
    final _returnDateController = TextEditingController();

    return DeviceData(
      builder: (context, device) => NewPage(
        children: [
          Header(
            date: Hive.box(userDataBoxName).get(userDataKeyName)["signUpDate"],
            title: "Debts",
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
                            return 'Please enter a name';
                          }
                          return null;
                        },
                        controller: _ownerName,
                        placeHolder: "Debt Name",
                        width: device.screenWidth * .5,
                        type: TextInputType.text,
                      ),
                      Input(
                        validator: (value) {
                          if (value.isEmpty) {
                            return 'Please enter a price';
                          }
                          return null;
                        },
                        controller: _debtController,
                        placeHolder: "price",
                        width: device.screenWidth * .5,
                        type: TextInputType.number,
                      ),
                      DateTimePicker(
                        placeholder: "Debt Date",
                        width: device.screenWidth * .5,
                        dateController: _debtDateController,
                      ),
                      DateTimePicker(
                        placeholder: "Return Date",
                        width: device.screenWidth * .5,
                        dateController: _returnDateController,
                      ),
                      Button(
                        width: device.screenWidth * .5,
                        text: "Add",
                        onPressed: () => addNewDebt(
                          debt: _debtController,
                          ownerName: _ownerName,
                          debtDate: _debtDateController,
                          returnDate: _returnDateController,
                        ),
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
                "New Debt",
                textAlign: TextAlign.center,
                style: TextStyle(
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
