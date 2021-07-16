import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:paypay/FrontEnd/constants/constants.dart';
import 'package:paypay/FrontEnd/responsive/UI/device_data.dart';

class DateTimePicker extends StatefulWidget {
  final double width;
  final TextEditingController dateController;
  final String placeholder;
  final bool isSignUp;

  const DateTimePicker(
      {this.width,
      this.isSignUp = false,
      this.placeholder,
      this.dateController});

  @override
  _DateTimePickerState createState() => _DateTimePickerState();
}

class _DateTimePickerState extends State<DateTimePicker> {
  String _setDate;

  String dateTime;

  DateTime selectedDate = DateTime.now();

  Future<Null> _selectDate(BuildContext context) async {
    final DateTime picked = await showDatePicker(
        context: context,
        initialDate: selectedDate,
        initialDatePickerMode: DatePickerMode.day,
        firstDate: DateTime(2000),
        lastDate: DateTime(2101));
    if (picked != null)
      setState(() {
        selectedDate = picked;
        widget.dateController.text = DateFormat.yMMMMd().format(selectedDate);
      });
  }

  @override
  void initState() {
    // _dateController.text = DateFormat.yMd().format(DateTime.now());

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return DeviceData(
      builder: (_, device) => Container(
        margin: EdgeInsets.only(bottom: device.screenWidth * .03),
        width: widget.width,
        child: AspectRatio(
          aspectRatio:
              widget.isSignUp ? 213 / (device.screenWidth * .28) : 213 / 55,
          child: InkWell(
            onTap: () {
              _selectDate(context);
            },
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: kDefaultPadding - 10),
              decoration: BoxDecoration(
                border: Border.all(color: kInActiveTextColor, width: 2),
                borderRadius: BorderRadius.circular((widget.isSignUp)
                    ? device.screenWidth * .04
                    : device.localWidth * .06),
              ),
              child: Center(
                child: LayoutBuilder(
                  builder: (context, constraints) => TextFormField(
                    textAlign: TextAlign.center,
                    enabled: false,
                    keyboardType: TextInputType.text,
                    controller: widget.dateController,
                    onSaved: (String val) {
                      _setDate = val;
                    },
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      disabledBorder:
                          UnderlineInputBorder(borderSide: BorderSide.none),
                      contentPadding: EdgeInsets.only(top: 0.0),
                      hintText: widget.placeholder,
                      hintStyle: TextStyle(
                          color: kInActiveTextColor,
                          height: (widget.isSignUp && device.screenWidth <= 320)
                              ? .1
                              : null,
                          fontWeight: FontWeight.w100,
                          fontSize:
                              (widget.isSignUp && device.screenWidth <= 320)
                                  ? constraints.maxHeight * .8
                                  : constraints.maxHeight * .3),
                    ),
                    style: TextStyle(
                        color: kDarkTextColor,
                        height: (widget.isSignUp && device.screenWidth <= 320)
                            ? .1
                            : null,
                        fontWeight: FontWeight.w700,
                        fontSize: (widget.isSignUp && device.screenWidth <= 320)
                            ? constraints.maxHeight * .8
                            : constraints.maxHeight * .3),
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
