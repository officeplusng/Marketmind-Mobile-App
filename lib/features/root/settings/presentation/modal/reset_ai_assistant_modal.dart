import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:marketmind/core/assets/assets.dart';
import 'package:marketmind/core/components/base_modal_parent.dart';
import 'package:marketmind/core/export/export.core.dart';
import 'package:marketmind/features/root/settings/presentation/components/settings_input_field.dart';

class ResetAiAssistantModal extends StatefulWidget {
  const ResetAiAssistantModal({super.key});

  @override
  State<ResetAiAssistantModal> createState() => _ResetAiAssistantModalState();
}

class _ResetAiAssistantModalState extends State<ResetAiAssistantModal> {
  final TextEditingController controller = TextEditingController();

  String _password = '';

  @override
  Widget build(BuildContext context) {
    return BaseModalParent(
        horizontalPadding: 0,
        verticalPadding: 0,
        verticalMargin: 0,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            10.verticalSpace,
            Center(
              child: BaseModalParent.modalPin(margin: 5),
            ),
            20.verticalSpace,
            Align(
              alignment: Alignment.centerLeft,
              child: SvgPicture.asset(SettingsAssets.settingsResetAISettings),
            ),
            20.verticalSpace,
            Text(
              'Reset AI Assistant Settings',
              style: context.textTheme.titleMedium
                  ?.copyWith(color: AppColors.textBlack),
            ),
            20.verticalSpace,
            Text(
              'Resetting your AI assistant will::',
              style: context.textTheme.bodyMedium?.copyWith(
                  color: AppColors.textGray1, fontWeight: FontWeight.w500),
            ),
            10.verticalSpace,
            Padding(
              padding: EdgeInsets.only(left: 10),
              child: Column(
                children: [
                  ...[
                    'Clear all personalized trading preferences',
                    'Reset risk tolerance and trading style settings',
                    'Remove custom market sectors and asset preferences',
                    'Reset AI alert sensitivity and notification preferences',
                    'Clear learned patterns from your trading behavior',
                  ].map((e) => Padding(
                        padding: const EdgeInsets.symmetric(vertical: 5),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.circle,
                              size: 8,
                              color: AppColors.black,
                            ),
                            5.horizontalSpace,
                            Text(
                              e,
                              style: context.textTheme.bodyMedium
                                  ?.copyWith(color: AppColors.textBlack),
                            )
                          ],
                        ),
                      ))
                ],
              ),
            ),
            20.verticalSpace,
            WrapperContainer.rectangular(
                useHeight: false,
                useWidth: false,
                width: double.infinity,
                padding: EdgeInsets.all(10),
                bordered: true,
                backgroundColor: Color(0XFFFFFAEB),
                borderRadius: 8,
                borderColor: Color(0XFFFEF0C7),
                child: Text.rich(TextSpan(
                    style: context.textTheme.bodyMedium?.copyWith(
                        color: Color(0XFFDC6803), fontWeight: FontWeight.w700),
                    text: '',
                    children: [
                      TextSpan(
                          style: context.textTheme.bodyMedium?.copyWith(
                              color: Color(0XFFDC6803),
                              fontWeight: FontWeight.w500),
                          text:
                              "You'll need to retrain the AI assistant with your preferences after resetting.")
                    ]))),
            20.verticalSpace,
            Row(
              children: [
                Expanded(
                    child: PrimaryButton.outlined(
                  text: 'Cancel',
                )),
                20.horizontalSpace,
                Expanded(
                    child: PrimaryButton.primary(
                  color: AppColors.red,
                  text: 'Reset AI Settings',
                )),
              ],
            ),
            20.verticalSpace
          ],
        ));
  }
}
