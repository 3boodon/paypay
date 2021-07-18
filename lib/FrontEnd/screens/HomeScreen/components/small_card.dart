import 'package:flutter/material.dart';
import 'package:paypay/FrontEnd/responsive/UI/device_data.dart';
import '../../../constants/constants.dart';
import './SmallCardComponents/new_button.dart';
import '../../../widgets/plus_icon.dart';
import './SmallCardComponents/small_card_title.dart';
import './SmallCardComponents/total_money.dart';

class SmallCard extends StatelessWidget {
  const SmallCard({
    @required this.date,
    @required this.onCardPressed,
    @required this.onButtonPressed,
    @required this.spentMoney,
    @required this.title,
  });
  final double spentMoney;
  final String date;
  final Function onCardPressed;
  final Function onButtonPressed;
  final String title;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onCardPressed,
      child: AspectRatio(
        aspectRatio: 167 / 210,
        child: DeviceData(
          builder: (context, constraints) => Container(
            clipBehavior: Clip.antiAlias,
            decoration: BoxDecoration(
              color: kPrimaryColor,
              borderRadius: BorderRadius.circular(constraints.localWidth * .12),
            ),
            child: Stack(
              children: [
                Positioned(
                  bottom: constraints.localHeight * .26,
                  left: (constraints.localWidth -
                          (constraints.localWidth * 0.27)) /
                      2,
                  right: (constraints.localWidth -
                          (constraints.localWidth * 0.27)) /
                      2,
                  child: PlusIcon(
                    width: constraints.localWidth * .27,
                    height: constraints.localHeight * .18,
                    color: kLightTextColor,
                  ),
                ),
                Positioned(
                  top: constraints.localHeight * .38,
                  left: 0,
                  right: 0,
                  child: TotalMoney(
                    spentMoney: spentMoney,
                    date: date,
                  ),
                ),
                Positioned(
                  top: constraints.localHeight * .10,
                  left: 0,
                  right: 0,
                  child: SmallCardTitle(
                    title: title,
                  ),
                ),
                // New Button
                Positioned(
                  bottom: -2,
                  left: (constraints.localWidth -
                          (constraints.localWidth * 0.7)) /
                      2,
                  right: (constraints.localWidth -
                          (constraints.localWidth * 0.7)) /
                      2,
                  child: NewButton(
                    height: constraints.localWidth * 0.29,
                    width: constraints.localHeight * 0.7,
                    onPressed: onButtonPressed,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
