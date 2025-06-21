import 'package:flutter/cupertino.dart';
import 'package:marketmind/core/export/export.core.dart';
import 'package:marketmind/features/root/settings/presentation/components/app_switch.dart';
import 'package:marketmind/features/root/settings/presentation/components/settings_input_field.dart';
import 'package:marketmind/features/root/settings/presentation/components/settings_scaffold.dart';

class SecurityScreen extends StatefulWidget {
  const SecurityScreen({super.key});

  @override
  State<SecurityScreen> createState() => _SecurityScreenState();
}

class _SecurityScreenState extends State<SecurityScreen> {
  final currentPasswordController = TextEditingController();
  final _newPasswordController = TextEditingController();

  bool toggleFaceId = false;

  bool toggle2fa = false;

  bool toggleViewHistory = false;

  @override
  Widget build(BuildContext context) {
    return SettingsScaffold(
        title: 'Security',
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            20.verticalSpace,
            Text(
              'Password',
              style: context.textTheme.titleSmall
                  ?.copyWith(color: AppColors.textBlack),
            ),
            30.verticalSpace,
            SettingsPasswordField(
                label: 'Current password',
                controller: currentPasswordController),
            20.verticalSpace,
            SettingsPasswordField(
              controller: _newPasswordController,
              label: 'New password',
            ),
            10.verticalSpace,
            Divider(
              color: AppColors.gray,
            ),
            10.verticalSpace,
            _title('Face ID'),
            10.verticalSpace,
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Enable Face ID?',
                  style: context.textTheme.titleSmall
                      ?.copyWith(color: AppColors.textGray1),
                ),
                AppSwitch(
                  initialValue: toggleFaceId,
                  onChanged: (value) {
                    setState(() {
                      toggleFaceId = value;
                    });
                  },
                )
              ],
            ),
            10.verticalSpace,
            Divider(
              color: AppColors.gray,
            ),
            10.verticalSpace,
            _title('Two-Factor Authentication'),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                AppSwitch(
                  initialValue: toggle2fa,
                  onChanged: (value) {
                    setState(() {
                      toggle2fa = value;
                    });
                  },
                ),
                10.horizontalSpace,
                Text(
                  'Two-factor authentication',
                  style: context.textTheme.titleSmall
                      ?.copyWith(color: AppColors.textGray1),
                ),
                Spacer(),
                TextButton(
                    onPressed: () {},
                    child: Text(
                      'Enable',
                      style: context.textTheme.titleSmall
                          ?.copyWith(color: AppColors.primary),
                    )),
              ],
            ),
            10.verticalSpace,
            Divider(
              color: AppColors.gray,
            ),
            10.verticalSpace,
            _title('Privacy'),
            10.verticalSpace,
            Text(
              'Show my view history',
              style: context.textTheme.bodyMedium?.copyWith(
                  fontWeight: FontWeight.w500, color: AppColors.textBlack),
            ),
            5.verticalSpace,
            Row(
              children: [
                Expanded(
                    child: Text(
                  "Choose what to show when Apps starts or when you switch workspaces",
                  style: context.textTheme.bodyMedium
                      ?.copyWith(color: AppColors.textGray),
                )),
                20.horizontalSpace,
                AppSwitch(
                  initialValue: toggleViewHistory,
                  onChanged: (value) => setState(() {
                    toggleViewHistory = !toggleViewHistory;
                  }),
                )
              ],
            ),
            50.verticalSpace,
            Row(
              children: [
                Expanded(
                    child: PrimaryButton.outlined(
                  text: 'Cancel',
                  onPressed: () {
                    context.pop();
                  },
                )),
                50.horizontalSpace,
                Expanded(
                    child: PrimaryButton.primary(
                  text: 'Save Settings',
                  onPressed: () {
                    //todo save settings
                  },
                ))
              ],
            ),
            50.verticalSpace,
          ],
        ));
  }

  Widget _title(String text) {
    return Text(
      text,
      style: context.textTheme.titleSmall?.copyWith(color: AppColors.textBlack),
    );
  }
}
