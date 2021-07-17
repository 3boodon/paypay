/// Packages & Libraries
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

/// Local Files Import
import '../../FrontEnd/responsive/UI/device_data.dart';
import '../constants/constants.dart';

class SearchInput extends StatelessWidget {
  const SearchInput(
      {@required this.placeHolder,
      this.width,
      @required this.type,
      this.alignLeft = false,
      this.onChange});
  final String placeHolder;
  final double width;
  final TextInputType type;
  final bool alignLeft;
  final Function onChange;
  @override
  Widget build(BuildContext context) {
    return DeviceData(
      builder: (context, device) => Container(
        margin: EdgeInsets.only(bottom: 20),
        padding: EdgeInsets.symmetric(horizontal: kDefaultPadding - 10),
        width: width,
        height: device.screenHeight * .07,
        decoration: BoxDecoration(
          border: Border.all(color: kInActiveTextColor, width: 2),
          borderRadius: BorderRadius.circular(device.screenWidth * .05),
        ),
        child: Center(
          child: Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(right: 10),
                child: SvgPicture.asset(
                  "assets/icons/search_icon.svg",
                  width: 20,
                  color: kInActiveTextColor,
                ),
              ),
              Expanded(
                child: LayoutBuilder(
                  builder: (_, constraints) => TextFormField(
                    onChanged: (value) => onChange(value),
                    textAlign: (alignLeft) ? TextAlign.left : TextAlign.center,
                    keyboardType: type,
                    obscureText:
                        (type == TextInputType.visiblePassword) ? true : false,
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.only(
                          bottom: (device.screenWidth <= 320)
                              ? constraints.maxHeight / 2
                              : 0),
                      border: InputBorder.none,
                      hintText: placeHolder,
                      hintStyle: TextStyle(
                        fontFamily: Constants.appLanguageCode == "ar"
                            ? "GE_SS"
                            : "Poppins",
                        color: kInActiveTextColor,
                        fontSize: device.localWidth * .05,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
