import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:marketmind/core/assets/assets.dart';
import 'package:marketmind/core/components/base_modal_parent.dart';
import 'package:marketmind/core/export/export.core.dart';
import 'package:marketmind/features/root/settings/presentation/components/settings_input_field.dart';

class DeleteAccountModal extends StatefulWidget {
  const DeleteAccountModal({super.key});

  @override
  State<DeleteAccountModal> createState() => _DeleteAccountModalState();
}

class _DeleteAccountModalState extends State<DeleteAccountModal> {
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
              child: SvgPicture.asset(SettingsAssets.settingsDeleteAccountIcon),
            ),
            20.verticalSpace,
            Text(
              'Delete Account',
              style: context.textTheme.titleMedium
                  ?.copyWith(color: AppColors.textBlack),
            ),
            20.verticalSpace,
            Text(
              'Closing your account will permanently delete:',
              style: context.textTheme.bodyMedium?.copyWith(
                  color: AppColors.textGray1, fontWeight: FontWeight.w500),
            ),
            10.verticalSpace,
            Padding(
              padding: EdgeInsets.only(left: 10),
              child: Column(
                children: [
                  ...[
                    'All watchlists and saved symbols',
                    'Trading history and performance metrics',
                    'Custom alerts and notifications',
                    'Personalized AI insights and analysis',
                    'Account settings and preferences'
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
                padding: EdgeInsets.all(8),
                bordered: true,
                backgroundColor: Color(0XFFFFFAEB),
                borderRadius: 8,
                borderColor: Color(0XFFFEF0C7),
                child: Text.rich(TextSpan(
                    style: context.textTheme.bodyMedium?.copyWith(
                        color: Color(0XFFDC6803), fontWeight: FontWeight.w700),
                    text: 'Important: ',
                    children: [
                      TextSpan(
                          style: context.textTheme.bodyMedium?.copyWith(
                              color: Color(0XFFDC6803),
                              fontWeight: FontWeight.w500),
                          text:
                              'If you have active trading positions or pending orders, please close them before proceeding.')
                    ]))),
            20.verticalSpace,
            Text(
              'Type account password to confirm:',
              style: context.textTheme.bodyMedium?.copyWith(
                  fontWeight: FontWeight.w500, color: AppColors.textBlack),
            ),
            5.verticalSpace,
            SettingsPasswordField(
              controller: controller,
              onChange: (value) {
                setState(() {
                  _password = value;
                });
              },
              hint: 'Password',
            ),
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
                  color: _password.isEmpty ? Color(0XFFFECDCA) : AppColors.red,
                  text: 'Delete Account',
                )),
              ],
            ),
            20.verticalSpace
          ],
        ));
  }
}
