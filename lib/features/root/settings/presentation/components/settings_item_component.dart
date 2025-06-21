import 'package:marketmind/core/export/export.core.dart';
import 'package:marketmind/features/root/settings/domain/entity/settings_entity.dart';

class SettingsItemComponent extends StatelessWidget {
  const SettingsItemComponent({super.key, required this.data,this.onClick});

  final SettingsEntity data;

  final VoidCallback? onClick;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onClick,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SvgPicture.asset(
            data.asset,
            width: 44,
            height: 44,
          ),
          10.horizontalSpace,
          Text(
            data.name,
            style: context.textTheme.titleSmall
                ?.copyWith(color: AppColors.textBlack),
          ),
          const Spacer(),
          if (data.canOpen)
            const Icon(
              Icons.keyboard_arrow_right,
              color: AppColors.textGray1,
            )
        ],
      ),
    );
  }
}
