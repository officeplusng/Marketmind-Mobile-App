
import 'package:flutter/gestures.dart';
import 'package:marketmind/core/components/export.core.component.dart';
import 'package:marketmind/core/export/export.core.dart';

import '../components/close_button_background.dart';

class UseBackUpCodeScreen extends StatefulWidget {
  const UseBackUpCodeScreen({super.key});

  @override
  State<UseBackUpCodeScreen> createState() =>
      _UseBackUpCodeScreenState();
}

class _UseBackUpCodeScreenState
    extends State<UseBackUpCodeScreen> {
  @override
  Widget build(BuildContext context) {
    var bodyMedium = context.textTheme.bodyMedium;
    var bodyMediumPrimary = bodyMedium?.copyWith(color: AppColors.primary);
    return BaseScaffold(
        backgroundColor: AppColors.coolBlack,

        child: SafeArea(child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(child:  SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AppCloseButton(),
                  40.verticalSpace,
                  Text(
                    'Use Backup Code',
                    style: context.textTheme.headlineMedium?.copyWith(
                        fontSize: 32,
                        fontWeight: FontWeight.w600,
                        color: AppColors.white),
                  ),
                  20.verticalSpace,
                  Text(
                    "Enter one of your emergency backup codes to\naccess your MarketMind account. Remember, each\nbackup code can only be used once.",
                    style: bodyMedium?.copyWith(color: AppColors.white),
                  ),
                  40.verticalSpace,
                  Text(
                    "Enter verification code",
                    style: bodyMedium?.copyWith(
                        color: AppColors.white, fontWeight: FontWeight.bold),
                  ),
                  15.verticalSpace,
                  InputField.filled(
                    label: 'Backup Code',
                    hint: 'Enter backup code',
                  ),
                  10.verticalSpace,
                ],
              ),
            )),
            Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                20.verticalSpace,
                PrimaryButton.primary(
                  onPressed: () {},
                  text: 'Verify & Continue',
                ),
                10.verticalSpace,
                PrimaryButton.light(
                  text: 'Return to Standard Verification',
                ),
                20.verticalSpace,
                Text.rich(TextSpan(
                  text: "If you've lost access to all your backup codes and verification methods, please contact\t",
                  style: bodyMedium?.copyWith(color: AppColors.white, fontSize: 14),
                  children:[
                    TextSpan(text: 'customer support',
                    style: bodyMediumPrimary?.copyWith(fontSize: 14),
                    recognizer: TapGestureRecognizer()
                    ..onTap=(){})
                  ]
                )),
                20.verticalSpace,
              ],
            )
          ],
        )));
  }
}
