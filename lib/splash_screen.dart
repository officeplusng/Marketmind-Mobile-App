import 'package:flutter/cupertino.dart';
import 'package:marketmind/core/components/export.core.component.dart';
import 'package:marketmind/core/export/export.core.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseScaffold(
        backgroundColor: AppColors.coolGray,
        verticalPadding: 0,
        horizontalPadding: 0,
        child: Stack(
          children: [
            Image.asset(
              Assets.splashGraphics,
              fit: BoxFit.fill,
            )
          ],
        ));
  }
}
