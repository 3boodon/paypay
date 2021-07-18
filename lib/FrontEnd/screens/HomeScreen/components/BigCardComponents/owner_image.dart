import 'package:flutter/material.dart';
import '../../../../constants/constants.dart';

class OwnerImage extends StatelessWidget {
  const OwnerImage({@required this.image});
  final String image;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 40,
      clipBehavior: Clip.antiAlias,
      decoration: BoxDecoration(
        border: Border.all(color: kPrimaryColor, width: 3),
        image: DecorationImage(
          image: AssetImage(image),
          colorFilter: ColorFilter.mode(kPrimaryColor, BlendMode.lighten),
        ),
        shape: BoxShape.circle,
      ),
    );
  }
}
