import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Setting extends StatelessWidget {
  const Setting({this.title, this.onTap});
  final String title;
  final Function onTap;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onTap,
      title: AutoSizeText(
        title,
        style: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
        maxFontSize: 40,
        maxLines: 1,
      ),
      trailing: Transform.rotate(
        angle: 9.3,
        child: SvgPicture.asset(
          "assets/icons/back_arrow.svg",
          width: MediaQuery.of(context).size.height * 0.012,
        ),
      ),
    );
  }
}
