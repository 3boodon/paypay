import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
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
                                "You Owe",
                                style: TextStyle(
                                  color: kLightTextColor,
                                  fontWeight: FontWeight.w500,
                                  fontSize: device.localWidth * .07,
                                ),
                              ),
                              AutoSizeText(
                                smartNumber(debt),
                                maxLines: 1,
                                style: TextStyle(
                                  color: kLightTextColor,
                                  fontWeight: FontWeight.bold,
                                  fontSize: device.localWidth * .13,
                                ),
                              ),
                              SizedBox(
                                height: device.localHeight * .30,
                                width: device.localWidth * .4,
                                child: LayoutBuilder(
                                  builder: (_, constraints) => Stack(
                                    children: [
                                      Positioned(
                                        left: constraints.maxWidth * .36,
                                        bottom: 0,
                                        top: 0,
                                        child: Opacity(
                                            opacity: .2,
                                            child: OwnerImage(
                                                image:
                                                    "assets/images/owner.png")),
                                      ),
                                      Positioned(
                                        left: constraints.maxWidth * .28,
                                        bottom: 0,
                                        top: 0,
                                        child: Opacity(
                                            opacity: .5,
                                            child: OwnerImage(
                                                image:
                                                    "assets/images/owner.png")),
                                      ),
                                      Positioned(
                                        left: constraints.maxWidth * .17,
                                        bottom: 0,
                                        top: 0,
                                        child: OwnerImage(
                                            image: "assets/images/owner.png"),
                                      ),
                                      Positioned(
                                        left: 0,
                                        bottom: 0,
                                        top: 0,
                                        child: OwnerImage(
                                            image: "assets/images/owner.png"),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              "Debts",
                              style: TextStyle(
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
                Positioned(
                  bottom: -device.localHeight * .01,
                  // bottom: 0,
                  right: device.localWidth * .07,
                  child: NewButton(
                    onPressed: onButtonPressed,
                    height: device.localHeight * .27,
                    width: device.localWidth * .34,
                  ),
                ),
              ],
            )),
          ),
        ),
      ),
    );
  }
}
