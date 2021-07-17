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
          onLongPress: () {
            Get.defaultDialog(
              barrierDismissible: true,
              radius: 10,
              titleStyle: TextStyle(fontWeight: FontWeight.bold),
              actions: [
                TextButton(
                  onPressed: () => Navigator.of(context).pop(),
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
                        labelStyle: TextStyle(
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
                        labelStyle: TextStyle(
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
                      UserData s = UserData.fromJSON(Map<String, dynamic>.from(
                          Hive.box(userDataBoxName).get(userDataKeyName)));

                      s.totalSpendings -= spendings[index].cost;
                      s.signUpDate = DateFormat.yMMMd().format(DateTime.now());

                      ModelsService().saveUserDataToHive(s);
                      ModelsService().deleteSpending(index);
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
      right: constraints.maxWidth * .04,
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
      left: 25,
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
            Text(
              "${translate("spentOn")} ${spendings[index].date}",
              style: TextStyle(
                fontFamily:
                    Constants.appLanguageCode == "ar" ? "GE_SS" : "Poppins",
                fontSize: constraints.maxWidth * .055,
                fontWeight: FontWeight.normal,
                color: kLightTextColor,
              ),
            ),
            Text(
              "${translate("cost")} ${smartNumber(spendings[index].cost)}",
              style: TextStyle(
                fontFamily:
                    Constants.appLanguageCode == "ar" ? "GE_SS" : "Poppins",
                fontSize: constraints.maxWidth * .08,
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
