import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_translate/flutter_translate.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:intl/intl.dart';

import 'package:paypay/BackEnd/Models/models.dart';
import 'package:paypay/BackEnd/services/buttons_services.dart';
import 'package:paypay/BackEnd/services/models_services.dart';
import 'package:paypay/FrontEnd/constants/constants.dart';
import 'package:paypay/FrontEnd/constants/useful_functions.dart';
import 'package:paypay/FrontEnd/responsive/UI/device_data.dart';
import 'package:paypay/FrontEnd/responsive/models/device_info.dart';
import 'package:paypay/FrontEnd/widgets/alertDialog.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

class SpendingsList extends StatelessWidget {
  final List<Spending> spendings;
  double _newCost;
  String _newName;

  SpendingsList({@required this.spendings});
  @override
  Widget build(BuildContext context) {
    return DeviceData(
      builder: (context, device) => ListView.builder(
        physics: BouncingScrollPhysics(),
        itemCount: spendings == null ? 0 : spendings.length,
        itemBuilder: (context, index) => InkWell(
          splashColor: kPrimaryColor,
          onLongPress: () {
            Get.defaultDialog(
              barrierDismissible: true,
              radius: 10,
              titleStyle: TextStyle(
                fontWeight: FontWeight.bold,
                fontFamily:
                    Constants.appLanguageCode == "ar" ? "GE_SS" : "Poppins",
              ),
              actions: [
                TextButton(
                  onPressed: () => Navigator.of(context).pop(),
                  style: ButtonStyle(
                    foregroundColor: MaterialStateColor.resolveWith(
                        (states) => kPrimaryColor),
                  ),
                  child: Text(
                    translate("cancel"),
                    style: TextStyle(
                      fontFamily: Constants.appLanguageCode == "ar"
                          ? "GE_SS"
                          : "Poppins",
                    ),
                  ),
                ),
                ElevatedButton(
                  onPressed: () => editSpendingPrice(
                    name: _newName,
                    index: index,
                    newCost: _newCost,
                    spendings: spendings,
                  ),
                  style: ButtonStyle(
                    backgroundColor: MaterialStateColor.resolveWith(
                        (states) => kPrimaryColor),
                  ),
                  child: Text(
                    translate("edit"),
                    style: TextStyle(
                      fontFamily: Constants.appLanguageCode == "ar"
                          ? "GE_SS"
                          : "Poppins",
                    ),
                  ),
                ),
              ],
              title: translate("edit"),
              content: Padding(
                padding:
                    EdgeInsets.symmetric(horizontal: device.localWidth * .04),
                child: Column(
                  children: [
                    TextFormField(
                      keyboardType: TextInputType.text,
                      onChanged: (value) {
                        _newName = value;
                      },
                      initialValue: "${spendings[index].spendingName}",
                      decoration: InputDecoration(
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: kPrimaryColor),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: kPrimaryColor),
                        ),
                        labelStyle: TextStyle(
                          color: kPrimaryColor,
                          fontFamily: Constants.appLanguageCode == "ar"
                              ? "GE_SS"
                              : "Poppins",
                        ),
                        border: OutlineInputBorder(),
                        labelText: translate("spending_name"),
                      ),
                    ),
                    SizedBox(height: device.localHeight * .02),
                    TextFormField(
                      keyboardType: TextInputType.number,
                      onChanged: (value) {
                        _newCost = double.parse(value) ?? spendings[index].cost;
                      },
                      initialValue: "${spendings[index].cost}",
                      decoration: InputDecoration(
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: kPrimaryColor),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: kPrimaryColor),
                        ),
                        labelStyle: TextStyle(
                          color: kPrimaryColor,
                          fontFamily: Constants.appLanguageCode == "ar"
                              ? "GE_SS"
                              : "Poppins",
                        ),
                        border: OutlineInputBorder(),
                        labelText: translate("cost"),
                      ),
                    ),
                    SizedBox(height: device.localHeight * .02),
                  ],
                ),
              ),
            );
          },
          child: Container(
            height: device.screenHeight * .17,
            margin: EdgeInsets.only(bottom: 20),
            clipBehavior: Clip.antiAlias,
            decoration: BoxDecoration(
              color: kPrimaryColor,
              borderRadius: BorderRadius.circular(device.screenWidth * .05),
            ),
            child: LayoutBuilder(
              builder: (context, constraints) => Stack(
                children: [
                  _CardText(
                    spendings: spendings,
                    constraints: constraints,
                    index: index,
                  ),
                  _DeleteButton(
                    onPressed: () async {
                      onDeleteButtonPressed(
                        context: context,
                        title: "Deleting a spending",
                        desc: "Are you sure you want to delete this spending?",
                        type: AlertType.warning,
                        deleteTap: () {
                          UserData s = UserData.fromJSON(
                              Map<String, dynamic>.from(
                                  Hive.box(userDataBoxName)
                                      .get(userDataKeyName)));

                          s.totalSpendings -= spendings[index].cost;
                          s.signUpDate =
                              DateFormat.yMMMd().format(DateTime.now());

                          ModelsService().saveUserDataToHive(s);
                          ModelsService().deleteSpending(index);
                          Navigator.of(context).pop();
                        },
                        confirmButtonText: "Yes",
                        cancelTap: () {
                          Navigator.of(context).pop();
                        },
                        cancelButtonText: "Cancel",
                      );
                    },
                    constraints: constraints,
                    device: device,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _DeleteButton extends StatelessWidget {
  const _DeleteButton({
    this.constraints,
    @required this.onPressed,
    this.device,
  });
  final Function onPressed;

  final BoxConstraints constraints;
  final DeviceInfo device;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: constraints.maxHeight * .1,
      right:
          Constants.appLanguageCode == "en" ? constraints.maxWidth * .04 : null,
      left:
          Constants.appLanguageCode == "ar" ? constraints.maxWidth * .04 : null,
      child: InkWell(
        onTap: onPressed,
        child: SizedBox(
          height: constraints.maxHeight * .4,
          child: AspectRatio(
            aspectRatio: 1,
            child: Container(
              decoration: BoxDecoration(
                color: kPrimaryLightColor,
                borderRadius: BorderRadius.circular(
                  device.screenWidth * .04,
                ),
              ),
              child: Center(
                child: SvgPicture.asset(
                  "assets/icons/trash_icon.svg",
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _CardText extends StatelessWidget {
  const _CardText({
    Key key,
    @required this.spendings,
    this.index,
    this.constraints,
  }) : super(key: key);
  final int index;
  final BoxConstraints constraints;
  final List<Spending> spendings;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: Constants.appLanguageCode == "en" ? 25 : null,
      right: Constants.appLanguageCode == "ar" ? 25 : null,
      top: 0,
      bottom: 0,
      child: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Spacer(),
            Text(
              "${spendings[index].spendingName}",
              style: TextStyle(
                fontFamily:
                    Constants.appLanguageCode == "ar" ? "GE_SS" : "Poppins",
                fontSize: constraints.maxWidth * .08,
                fontWeight: FontWeight.bold,
                color: kLightTextColor,
              ),
            ),
            AutoSizeText.rich(
              TextSpan(children: [
                TextSpan(
                    text: "${translate("spentOn")} ",
                    style: TextStyle(
                      fontFamily: Constants.appLanguageCode == "ar"
                          ? "GE_SS"
                          : "Poppins",
                    )),
                TextSpan(
                    text: spendings[index].date,
                    style: TextStyle(
                      fontFamily: "Poppins",
                    )),
              ]),
              style: TextStyle(
                fontSize: constraints.maxWidth * .050,
                color: kLightTextColor,
              ),
            ),
            AutoSizeText.rich(
              TextSpan(children: [
                TextSpan(
                    text: "${translate("cost")} ",
                    style: TextStyle(
                      fontFamily: Constants.appLanguageCode == "ar"
                          ? "GE_SS"
                          : "Poppins",
                    )),
                TextSpan(
                    text: smartNumber(spendings[index].cost),
                    style: TextStyle(
                      fontFamily: "Poppins",
                    )),
              ]),
              style: TextStyle(
                fontSize: Constants.appLanguageCode == "ar"
                    ? constraints.maxWidth * .07
                    : constraints.maxWidth * .08,
                fontWeight: FontWeight.bold,
                color: kLightTextColor,
              ),
            ),
            Spacer(),
          ],
        ),
      ),
    );
  }
}
