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
                        onPressed: () => editDebt(
                            index: index,
                            debts: debts,
                            newDebt: _newDebt,
                            ownerName: _newOwnerName),
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
                            onChanged: (value) {
                              _newOwnerName = value;
                            },
                            initialValue: "${debts[index].ownerName}",
                            decoration: InputDecoration(
                              labelStyle: TextStyle(
                                fontFamily: Constants.appLanguageCode == "ar"
                                    ? "GE_SS"
                                    : "Poppins",
                              ),
                              border: OutlineInputBorder(),
                              labelText: translate("owner_name"),
                            ),
                          ),
                          SizedBox(height: device.localHeight * .02),
                          TextFormField(
                            keyboardType: TextInputType.number,
                            onChanged: (value) {
                              _newDebt = double.parse(value) ??
                                  debts[index].debtAmount;
                            },
                            initialValue: "${debts[index].debtAmount}",
                            decoration: InputDecoration(
                              labelStyle: TextStyle(
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
                  height: device.screenHeight * .25,
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
                            ModelsService().deleteDebt(index);

                            UserData s = UserData.fromJSON(
                                Map<String, dynamic>.from(
                                    Hive.box(userDataBoxName)
                                        .get(userDataKeyName)));

                            s.totalDebts -= debts[index].debtAmount;
                            ModelsService().saveUserDataToHive(s);
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
      right: -2,
      child: InkWell(
        onTap: onPressed,
        child: Container(
          width: 60,
          height: 75,
          decoration: BoxDecoration(
            color: kPrimaryLightColor,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(device.screenWidth * .05),
              bottomLeft: Radius.circular(device.screenWidth * .05),
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
      left: 25,
      top: 0,
      bottom: 0,
      child: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Spacer(),
            Text(
              "${debts[index].ownerName}",
              style: TextStyle(
                fontSize: constraints.maxWidth * .08,
                fontWeight: FontWeight.bold,
                color: kLightTextColor,
              ),
            ),
            Text(
              "${translate("debtTakenOn")}: ${debts[index].debtDate}",
              style: TextStyle(
                fontFamily:
                    Constants.appLanguageCode == "ar" ? "GE_SS" : "Poppins",
                fontSize: constraints.maxWidth * .05,
                fontWeight: FontWeight.normal,
                color: kLightTextColor,
              ),
            ),
            Spacer(
              flex: 2,
            ),
            Text(
              "${translate("debts")} ${smartNumber(debts[index].debtAmount)} ",
              style: TextStyle(
                fontFamily:
                    Constants.appLanguageCode == "ar" ? "GE_SS" : "Poppins",
                fontSize: constraints.maxWidth * .08,
                fontWeight: FontWeight.bold,
                color: kLightTextColor,
              ),
            ),
            Text(
              "${translate("shouldBeReturnedOn")} :\n${debts[index].returnDate}",
              style: TextStyle(
                fontFamily:
                    Constants.appLanguageCode == "ar" ? "GE_SS" : "Poppins",
                fontSize: constraints.maxWidth * .05,
                height: 1.2,
                fontWeight: FontWeight.normal,
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
