import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_translate/flutter_translate.dart';
import 'package:hive/hive.dart';
import 'package:paypay/BackEnd/Models/models.dart';
import 'package:paypay/BackEnd/services/models_services.dart';
import 'package:paypay/FrontEnd/constants/useful_functions.dart';
import 'package:paypay/FrontEnd/responsive/UI/device_data.dart';
import '../../../constants/constants.dart';
import './BigCardComponents/owner_image.dart';
import './SmallCardComponents/new_button.dart';
import '../../../widgets/plus_icon.dart';

class BigCard extends StatelessWidget {
  const BigCard({
    @required this.onCardPressed,
    @required this.onButtonPressed,
    @required this.debt,
  });
  final Function onCardPressed;
  final Function onButtonPressed;
  final double debt;
  @override
  Widget build(BuildContext context) {
    UserData data = UserData.fromJSON(Map<String, dynamic>.from(
        Hive.box(userDataBoxName).get(userDataKeyName)));
    return GestureDetector(
      onTap: onCardPressed,
      child: AspectRatio(
        aspectRatio: 340 / 167,
        child: DeviceData(
          builder: (context, device) => Container(
            clipBehavior: Clip.antiAlias,
            decoration: BoxDecoration(
              color: kPrimaryColor,
              borderRadius: BorderRadius.circular(device.localWidth * .06),
            ),
            child: (Stack(
              children: [
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 30, vertical: 20),
                  child: DeviceData(
                    builder: (context, device) => Row(
                      children: [
                        Expanded(
                          flex: 15,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                translate("youOwe"),
                                style: TextStyle(
                                  fontFamily: Constants.appLanguageCode == "ar"
                                      ? "GE_SS"
                                      : "Poppins",
                                  color: kLightTextColor,
                                  fontWeight: FontWeight.w500,
                                  fontSize: device.localWidth * .07,
                                ),
                              ),
                              AutoSizeText(
                                smartNumber(debt),
                                maxLines: 1,
                                style: TextStyle(
                                  fontFamily: "Poppins",
                                  color: kLightTextColor,
                                  fontWeight: FontWeight.bold,
                                  fontSize: device.localWidth * .13,
                                ),
                              ),
                              Spacer(
                                flex: 3,
                              ),
                              SizedBox(
                                height: device.localHeight * .30,
                                width: device.localWidth * .4,
                                child: LayoutBuilder(
                                  builder: (_, constraints) => Stack(
                                    children: [
                                      Positioned(
                                        left: Constants.appLanguageCode == "en"
                                            ? constraints.maxWidth * .36
                                            : null,
                                        right: Constants.appLanguageCode == "ar"
                                            ? constraints.maxWidth * .36
                                            : null,
                                        bottom: 0,
                                        top: 0,
                                        child: Opacity(
                                            opacity: .2,
                                            child: OwnerImage(
                                                image:
                                                    "assets/images/${data.picture}")),
                                      ),
                                      Positioned(
                                        left: Constants.appLanguageCode == "en"
                                            ? constraints.maxWidth * .28
                                            : null,
                                        right: Constants.appLanguageCode == "ar"
                                            ? constraints.maxWidth * .28
                                            : null,
                                        bottom: 0,
                                        top: 0,
                                        child: Opacity(
                                            opacity: .5,
                                            child: OwnerImage(
                                                image:
                                                    "assets/images/${data.picture}")),
                                      ),
                                      Positioned(
                                        left: Constants.appLanguageCode == "en"
                                            ? constraints.maxWidth * .17
                                            : null,
                                        right: Constants.appLanguageCode == "ar"
                                            ? constraints.maxWidth * .17
                                            : null,
                                        bottom: 0,
                                        top: 0,
                                        child: OwnerImage(
                                            image:
                                                "assets/images/${data.picture}"),
                                      ),
                                      Positioned(
                                        left: Constants.appLanguageCode == "en"
                                            ? 0
                                            : null,
                                        right: Constants.appLanguageCode == "ar"
                                            ? 0
                                            : null,
                                        bottom: 0,
                                        top: 0,
                                        child: OwnerImage(
                                            image:
                                                "assets/images/${data.picture}"),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              Spacer(),
                            ],
                          ),
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              translate("debts"),
                              style: TextStyle(
                                fontFamily: Constants.appLanguageCode == "ar"
                                    ? "GE_SS"
                                    : "Poppins",
                                color: kLightTextColor,
                                fontWeight: FontWeight.bold,
                                fontSize: device.localWidth * .1,
                              ),
                            ),
                            Spacer(),
                            SizedBox(
                              height: device.localWidth * .17,
                              width: device.localWidth * .2,
                              child: PlusIcon(
                                height: 7,
                                width: device.localWidth * .2,
                                color: kLightTextColor,
                              ),
                            ),
                            Spacer(
                              flex: 6,
                            ),
                          ],
                        ),
                        Spacer(),
                      ],
                    ),
                  ),
                ),
                Constants.appLanguageCode == 'ar'
                    ? Positioned(
                        bottom: -device.localHeight * .01,
                        // bottom: 0,

                        left: device.localWidth * .07,
                        child: NewButton(
                          onPressed: onButtonPressed,
                          height: device.localHeight * .27,
                          width: device.localWidth * .34,
                        ),
                      )
                    : Positioned(
                        bottom: -device.localHeight * .01,
                        // bottom: 0,

                        right: device.localWidth * .07,
                        child: NewButton(
                          onPressed: onButtonPressed,
                          height: device.localHeight * .27,
                          width: device.localWidth * .34,
                        ),
                      )
              ],
            )),
          ),
        ),
      ),
    );
  }
}
