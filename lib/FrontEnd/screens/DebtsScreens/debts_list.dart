import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_translate/flutter_translate.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:paypay/BackEnd/Models/models.dart';
import 'package:paypay/BackEnd/services/buttons_services.dart';
import 'package:paypay/BackEnd/services/models_services.dart';
import 'package:paypay/FrontEnd/constants/constants.dart';
import 'package:paypay/FrontEnd/constants/useful_functions.dart';
import 'package:paypay/FrontEnd/responsive/UI/device_data.dart';
import 'package:paypay/FrontEnd/responsive/models/device_info.dart';
import 'package:paypay/FrontEnd/widgets/alertDialog.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

class DebtsList extends StatelessWidget {
  DebtsList({
    @required this.debts,
  });
  final List<Debt> debts;
  String _newOwnerName;
  double _newDebt;
  @override
  Widget build(BuildContext context) {
    return DeviceData(
        builder: (context, device) => ListView.builder(
              physics: BouncingScrollPhysics(),
              itemCount: debts != null ? debts.length : 0,
              itemBuilder: (BuildContext context, int index) => InkWell(
                splashColor: kPrimaryColor,
                onLongPress: () {
                  Get.defaultDialog(
                    barrierDismissible: true,
                    radius: 10,
                    titleStyle: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontFamily: Constants.appLanguageCode == "ar"
                          ? "GE_SS"
                          : "Poppins",
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
                        onPressed: () => editDebt(
                            index: index,
                            debts: debts,
                            newDebt: _newDebt,
                            ownerName: _newOwnerName),
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
                      padding: EdgeInsets.symmetric(
                          horizontal: device.localWidth * .04),
                      child: Column(
                        children: [
                          TextFormField(
                            keyboardType: TextInputType.text,
                            enableSuggestions: true,
                            cursorColor: kPrimaryColor,
                            onChanged: (value) {
                              _newOwnerName = value;
                            },
                            initialValue: "${debts[index].ownerName}",
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
                              labelText: translate("debt_name"),
                            ),
                          ),
                          SizedBox(height: device.localHeight * .02),
                          TextFormField(
                            keyboardType: TextInputType.number,
                            onChanged: (value) {
                              _newDebt = double.parse(value) ??
                                  debts[index].debtAmount;
                            },
                            cursorColor: kPrimaryColor,
                            initialValue: "${debts[index].debtAmount}",
                            decoration: InputDecoration(
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: kPrimaryColor),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: kPrimaryColor),
                              ),
                              focusColor: kPrimaryColor,
                              labelStyle: TextStyle(
                                color: kPrimaryColor,
                                fontFamily: Constants.appLanguageCode == "ar"
                                    ? "GE_SS"
                                    : "Poppins",
                              ),
                              border: OutlineInputBorder(),
                              labelText: translate("debt_amount"),
                            ),
                          ),
                          SizedBox(height: device.localHeight * .02),
                        ],
                      ),
                    ),
                  );
                },
                child: Container(
                  height: device.screenHeight * .26,
                  margin: EdgeInsets.only(bottom: 20),
                  clipBehavior: Clip.antiAlias,
                  decoration: BoxDecoration(
                    color: kPrimaryColor,
                    borderRadius:
                        BorderRadius.circular(device.screenWidth * .05),
                  ),
                  child: LayoutBuilder(
                    builder: (context, constraints) => Stack(
                      children: [
                        _CardText(
                          constraints: constraints,
                          debts: debts,
                          index: index,
                        ),
                        _DeleteButton(
                          onPressed: () async {
                            onDeleteButtonPressed(
                              context: context,
                              title: "Deleting a debt",
                              desc:
                                  "Are you sure you want to delete this debt?",
                              type: AlertType.warning,
                              deleteTap: () {
                                ModelsService().deleteDebt(index);

                                UserData s = UserData.fromJSON(
                                    Map<String, dynamic>.from(
                                        Hive.box(userDataBoxName)
                                            .get(userDataKeyName)));

                                s.totalDebts -= debts[index].debtAmount;
                                ModelsService().saveUserDataToHive(s);
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
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ));
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
      bottom: (device.screenHeight * .25 - 75) / 2,
      top: (device.screenHeight * .25 - 75) / 2,
      right: Constants.appLanguageCode == "en" ? -2 : null,
      left: Constants.appLanguageCode == "ar" ? -2 : null,
      child: InkWell(
        onTap: onPressed,
        child: Container(
          width: 60,
          height: 75,
          decoration: BoxDecoration(
            color: kPrimaryLightColor,
            borderRadius: BorderRadius.only(
              topLeft: Constants.appLanguageCode == "en"
                  ? Radius.circular(device.screenWidth * .05)
                  : Radius.circular(0),
              topRight: Constants.appLanguageCode == "ar"
                  ? Radius.circular(device.screenWidth * .05)
                  : Radius.circular(0),
              bottomLeft: Constants.appLanguageCode == "en"
                  ? Radius.circular(device.screenWidth * .05)
                  : Radius.circular(0),
              bottomRight: Constants.appLanguageCode == "ar"
                  ? Radius.circular(device.screenWidth * .05)
                  : Radius.circular(0),
            ),
          ),
          child: Center(
            child: SvgPicture.asset("assets/icons/trash_icon.svg"),
          ),
        ),
      ),
    );
  }
}

class _CardText extends StatelessWidget {
  const _CardText({
    @required this.debts,
    this.index,
    this.constraints,
  });
  final int index;
  final BoxConstraints constraints;
  final List<Debt> debts;

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
            AutoSizeText(
              "${debts[index].ownerName}",
              style: TextStyle(
                fontSize: constraints.maxWidth * .08,
                fontWeight: FontWeight.bold,
                fontFamily:
                    Constants.appLanguageCode == "ar" ? "GE_SS" : "Poppins",
                color: kLightTextColor,
              ),
              maxLines: 1,
            ),
            AutoSizeText.rich(
              TextSpan(children: [
                TextSpan(
                    text: "${translate("debtTakenOn")}  ",
                    style: TextStyle(
                        fontFamily: Constants.appLanguageCode == "ar"
                            ? "GE_SS"
                            : "Poppins")),
                TextSpan(
                    text: debts[index].debtDate,
                    style: TextStyle(
                      fontFamily: "Poppins",
                    )),
              ]),
              style: TextStyle(
                fontSize: constraints.maxWidth * .048,
                color: kLightTextColor,
              ),
            ),
            Spacer(
              flex: 2,
            ),
            AutoSizeText.rich(
              TextSpan(children: [
                TextSpan(
                    text: "${translate("debts")} ",
                    style: TextStyle(
                        fontFamily: Constants.appLanguageCode == "ar"
                            ? "GE_SS"
                            : "Poppins")),
                TextSpan(
                    text: smartNumber(debts[index].debtAmount),
                    style: TextStyle(
                      fontFamily: "Poppins",
                    )),
              ]),
              style: TextStyle(
                height: Constants.appLanguageCode == "en" ? .9 : null,
                fontSize: Constants.appLanguageCode == "ar"
                    ? constraints.maxWidth * .07
                    : constraints.maxWidth * .08,
                fontWeight: FontWeight.bold,
                color: kLightTextColor,
              ),
            ),
            AutoSizeText.rich(
              TextSpan(children: [
                TextSpan(
                    text: Constants.appLanguageCode == "ar"
                        ? "${translate("shouldBeReturnedOn")}  "
                        : "${translate("shouldBeReturnedOn")}\n",
                    style: TextStyle(
                        fontFamily: Constants.appLanguageCode == "ar"
                            ? "GE_SS"
                            : "Poppins")),
                TextSpan(
                    text: debts[index].returnDate,
                    style: TextStyle(fontFamily: "Poppins", height: 1)),
              ]),
              style: TextStyle(
                fontSize: constraints.maxWidth * .048,
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
