import 'package:flutter/cupertino.dart';
import 'package:marketmind/core/export/export.core.dart';
import 'package:marketmind/features/root/settings/presentation/components/app_switch.dart';
import 'package:marketmind/features/root/settings/presentation/components/notification_settings_component.dart';
import 'package:marketmind/features/root/settings/presentation/components/settings_input_field.dart';
import 'package:marketmind/features/root/settings/presentation/components/settings_scaffold.dart';

class NotificationSettings extends StatefulWidget {
  const NotificationSettings({super.key});

  @override
  State<NotificationSettings> createState() => _NotificationSettingsState();
}

class _NotificationSettingsState extends State<NotificationSettings> {
  final currentPasswordController = TextEditingController();
  final _newPasswordController = TextEditingController();

  bool toggleFaceId = false;

  bool toggle2fa = false;

  bool toggleViewHistory = false;

  @override
  Widget build(BuildContext context) {
    return SettingsScaffold(
        title: 'Notifications',
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            20.verticalSpace,

            _title('Price Alerts'),
            20.verticalSpace,

            NotificationSettingsComponent(title: 'Push Notifications',description: 'Receive alerts on your device',),
            10.verticalSpace,
            NotificationSettingsComponent(title: 'Email Notifications',description: 'Receive alerts via email',),
            10.verticalSpace,
            NotificationSettingsComponent(title: 'SMS Alerts',description: 'Receive alerts via SMS',onChanged: (value){},),
            10.verticalSpace,
            Divider(
              color: AppColors.gray,
            ),
            20.verticalSpace,
            _title('AI Signals & Market Events'),
            20.verticalSpace,

            NotificationSettingsComponent(title: 'AI Signal Changes',description: 'Notify when AI signal changes',onChanged: (value){},),
            10.verticalSpace,
            NotificationSettingsComponent(title: 'Volume Alerts',description: 'Unusual volume notifications',onChanged: (value){},),
            10.verticalSpace,
            NotificationSettingsComponent(title: 'News Alerts',description: 'Breaking market news',onChanged: (value){},),
            10.verticalSpace,
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
