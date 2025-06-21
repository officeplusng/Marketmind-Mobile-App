import 'package:marketmind/core/export/export.core.dart';
import 'package:marketmind/features/root/settings/presentation/components/app_switch.dart';

class NotificationSettingsComponent extends StatelessWidget {
  const NotificationSettingsComponent(
      {super.key,
      this.initialValue = false,
      this.onChanged,
      required this.title,
      this.description});

  final bool initialValue;
  final void Function(bool)? onChanged;
  final String title;
  final String? description;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Expanded(
            child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              title,
              style: context.textTheme.bodyMedium
                  ?.copyWith(color: AppColors.textBlack),
            ),
            if (description != null) ...[
              5.verticalSpace,
              Text(
                description!,
                style: context.textTheme.bodyMedium
                    ?.copyWith(color: AppColors.textGray),
              )
            ]
          ],
        )),
        20.horizontalSpace,
        AppSwitch(
          initialValue: initialValue,
          onChanged: (value) {
            onChanged?.call(value);
          },
        )
      ],
    );
  }
}
