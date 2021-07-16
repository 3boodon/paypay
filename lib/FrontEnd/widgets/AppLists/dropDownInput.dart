import 'package:flutter/material.dart';
import 'package:paypay/FrontEnd/constants/constants.dart';
import 'package:paypay/FrontEnd/responsive/UI/device_data.dart';

class DropDownInput extends StatelessWidget {
  const DropDownInput({
    @required this.hint,
    this.width = double.infinity,
    @required this.options,
    @required this.onChange,
    @required this.value,
    // this.isSignUp = false,
    this.controller,
    this.validator,
  });
  final String hint; // This appears as a title for the dropdownButton
  final double width;
  final List
      options; // This is the List of The diffrenet choices that the user well be choosing from it
  final Function onChange;
  final value;
  // final bool isSignUp;
  final TextEditingController controller;
  final Function validator;

  @override
  Widget build(BuildContext context) {
    return DeviceData(
      builder: (_, device) => Container(
        margin: EdgeInsets.only(bottom: device.screenWidth * .03),
        width: width,
        child: AspectRatio(
          aspectRatio: 213 / (device.screenWidth * .28),
          child: Container(
            alignment: Alignment.center,
            decoration: BoxDecoration(
              border: Border.all(color: kInActiveTextColor, width: 2),
              borderRadius: BorderRadius.circular(device.screenWidth * .04),
            ),
            child: DropdownButton(
              hint: Text("$hint"),
              value: value,
              onChanged: (selectedOption) => onChange(selectedOption),
              items: options.map<DropdownMenuItem<dynamic>>((value) {
                return DropdownMenuItem<dynamic>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
              // Drop Down Button Style
              elevation: 10,
              underline: Container(),
              dropdownColor: Color(0xFFF5F5F5),
            ),
          ),
        ),
      ),
    );
  }
}
