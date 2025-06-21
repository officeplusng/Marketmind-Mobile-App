import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../export/export.core.dart';

class AppLogo extends StatelessWidget {
  const AppLogo({super.key, required this.assetName, this.width, this.height});

  final double? width;
  final double? height;
  final String assetName;

  factory AppLogo.dark() {
    return AppLogo(assetName: Assets.appLogo);
  }
  factory AppLogo.light() {
    return AppLogo(assetName: Assets.logoWhite);
  }
  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      assetName,
      width: width,
      height: height,
    );
  }
}
