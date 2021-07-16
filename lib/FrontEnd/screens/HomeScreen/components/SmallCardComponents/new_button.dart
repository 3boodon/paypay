import 'package:flutter/material.dart';
import 'package:paypay/FrontEnd/responsive/UI/device_data.dart';
import '../../../../constants/constants.dart';

class NewButton extends StatelessWidget {
  const NewButton({@required this.onPressed, this.width, this.height});
  final double width;
  final double height;
  final Function onPressed;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: DeviceData(
        builder: (context, device) => Container(
          width: width,
          height: height,
          clipBehavior: Clip.antiAlias,
          decoration: BoxDecoration(
            color: kLightTextColor,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20),
              topRight: Radius.circular(20),
            ),
          ),
          child: LayoutBuilder(
            builder: (context, constraints) => Center(
              child: Text(
                "New",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: kDarkTextColor,
                  fontSize: constraints.maxWidth * .18,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
