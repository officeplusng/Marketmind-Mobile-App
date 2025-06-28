import 'package:marketmind/features/root/component/custom_app_bar.dart';
import 'package:marketmind/features/root/settings/domain/entity/settings_entity.dart';
import 'package:marketmind/features/root/settings/presentation/components/settings_category_component.dart';
import '../../../../core/export/export.core.dart';

class SettingsRoot extends StatefulWidget {
  const SettingsRoot({super.key,this.isRoot=false});
  final bool isRoot;

  @override
  State<SettingsRoot> createState() => _SettingsRootState();
}

class _SettingsRootState extends State<SettingsRoot> {
  @override
  Widget build(BuildContext context) {
    return BaseScaffold(
        horizontalPadding: 20,
        child: SafeArea(
            child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            20.verticalSpace,
          if(!widget.isRoot)
            ...[
              CustomAppBar(),
              20.verticalSpace,
            ],
            Text(
              'Settings',
              style: context.textTheme.headlineMedium
                  ?.copyWith(color: AppColors.textBlack),
            ),
            20.verticalSpace,
            Expanded(
                child: ListView.separated(
                    shrinkWrap: true,
                    padding: const EdgeInsets.all(0),
                    itemBuilder: (_, index) => SettingsCategoryComponent(
                        category: settingsCategories[index]),
                    separatorBuilder: (_, index) => 20.verticalSpace,
                    itemCount: settingsCategories.length))
          ],
        )));
  }
}
