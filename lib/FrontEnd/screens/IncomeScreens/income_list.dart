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

class PurchasesList extends StatelessWidget {
  final List<Purchase> purchases;

  PurchasesList({@required this.purchases});
  double _newPrice;
  String _newName;

  @override
  Widget build(BuildContext context) {
    return DeviceData(
      builder: (context, device) => ListView.builder(
        physics: BouncingScrollPhysics(),
        itemCount: purchases == null ? 0 : purchases.length,
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
                  onPressed: () => editPurchasePrice(
                    index: index,
                    purchases: purchases,
                    newPrice: _newPrice,
                    name: _newName,
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
                      enableSuggestions: true,
                      onChanged: (value) {
                        _newName = value;
                      },
                      initialValue: "${purchases[index].purchaseName}",
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
                        labelText: translate("income_resource"),
                      ),
                    ),
                    SizedBox(height: device.localHeight * .02),
                    TextFormField(
                      keyboardType: TextInputType.number,
                      onChanged: (value) {
                        _newPrice =
                            double.parse(value) ?? purchases[index].price;
                      },
                      initialValue: "${purchases[index].price}",
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
                        labelText: translate("incomeAmount"),
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
                    purchases: purchases,
                    constraints: constraints,
                    index: index,
                  ),
                  _DeleteButton(
                    onPressed: () async {
                      UserData s = UserData.fromJSON(Map<String, dynamic>.from(
                          Hive.box(userDataBoxName).get(userDataKeyName)));

                      s.totalPurchases -= purchases[index].price;
                      s.signUpDate = DateFormat.yMMMd().format(DateTime.now());

                      ModelsService().saveUserDataToHive(s);

                      ModelsService().deletePurchases(index);
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
    @required this.purchases,
    this.index,
    this.constraints,
  }) : super(key: key);
  final int index;
  final BoxConstraints constraints;
  final List<Purchase> purchases;

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
              "${purchases[index].purchaseName}",
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
                    text: "${translate("recievedOn")} ",
                    style: TextStyle(
                      fontFamily: Constants.appLanguageCode == "ar"
                          ? "GE_SS"
                          : "Poppins",
                    )),
                TextSpan(
                    text: purchases[index].date,
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
                    text: "${translate("incomeAmount")} ",
                    style: TextStyle(
                      fontFamily: Constants.appLanguageCode == "ar"
                          ? "GE_SS"
                          : "Poppins",
                    )),
                TextSpan(
                    text: smartNumber(purchases[index].price),
                    style: TextStyle(
                      fontFamily: "Poppins",
                    )),
              ]),
              style: TextStyle(
                fontSize: constraints.maxWidth * .07,
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
