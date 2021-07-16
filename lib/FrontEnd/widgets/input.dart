import 'package:flutter/material.dart';
import 'package:paypay/FrontEnd/responsive/UI/device_data.dart';
import '../constants/constants.dart';

class Input extends StatelessWidget {
  const Input({
    @required this.placeHolder,
    this.width = double.infinity,
    @required this.type,
    this.alignLeft = false,
    this.controller,
    this.onSaved,
    this.onTap,
    this.onChanged,
    this.validator,
    this.isSignUp = false,
  });
  final String placeHolder;
  final double width;
  final TextInputType type;
  final bool alignLeft;
  final TextEditingController controller;
  final Function onSaved;
  final Function onTap;
  final Function onChanged;
  final Function validator;
  final bool isSignUp;
  @override
  Widget build(BuildContext context) {
    return DeviceData(
      builder: (_, device) => Container(
        margin: EdgeInsets.only(bottom: device.screenWidth * .03),
        width: width,
        child: AspectRatio(
          aspectRatio: isSignUp ? 213 / (device.screenWidth * .28) : 213 / 55,
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: kDefaultPadding - 10),
            decoration: BoxDecoration(
              border: Border.all(color: kInActiveTextColor, width: 2),
              borderRadius: BorderRadius.circular((isSignUp)
                  ? device.screenWidth * .04
                  : device.localWidth * .06),
            ),
            child: Center(
              child: LayoutBuilder(
                builder: (context, constraints) => TextFormField(
                  enableSuggestions: true,
                  onChanged: onChanged,
                  onTap: onTap,
                  onSaved: onSaved,
                  controller: controller,
                  validator: (value) => validator(value),
                  textAlign: (alignLeft) ? TextAlign.left : TextAlign.center,
                  keyboardType: type,
                  obscureText:
                      (type == TextInputType.visiblePassword) ? true : false,
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.only(
                        bottom: (isSignUp && device.screenWidth <= 320)
                            ? constraints.maxHeight / 2
                            : 0),
                    border: InputBorder.none,
                    hintText: placeHolder,
                    hintStyle: TextStyle(
                      color: kInActiveTextColor,
                      fontSize: (isSignUp && device.screenWidth <= 320)
                          ? constraints.maxHeight * .8
                          : constraints.maxHeight * .3,
                      height:
                          (isSignUp && device.screenWidth <= 320) ? .1 : null,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
