import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:paypay/FrontEnd/constants/useful_functions.dart';
import 'package:paypay/FrontEnd/responsive/UI/device_data.dart';
import '../../../../constants/constants.dart';

class TotalMoney extends StatelessWidget {
  const TotalMoney({
    @required this.date,
    @required this.spentMoney,
  });

  final String date;
  final double spentMoney;

  @override
  Widget build(BuildContext context) {
    return DeviceData(
      builder: (context, device) => SizedBox(
        height: device.localWidth * .9,
        child: Column(
          children: [
            Padding(
              padding:
                  EdgeInsets.symmetric(horizontal: device.localWidth * .07),
              child: AutoSizeText(
                "${smartNumber(spentMoney)}",
                maxLines: 1,
                style: TextStyle(
                  height: .3,
                  fontWeight: FontWeight.w700,
                  fontSize: device.localWidth * .2,
                  color: kLightTextColor,
                  fontFamily: "Poppins",
                ),
              ),
            ),
            (date != null)
                ? AutoSizeText(
                    "$date",
                    style: TextStyle(
                      fontWeight: FontWeight.w300,
                      fontSize: device.localWidth * .09,
                      color: kLightTextColor,
                      fontFamily: "Poppins",
                    ),
                  )
                : AutoSizeText(
                    "",
                  ),
          ],
        ),
      ),
    );
  }
}
