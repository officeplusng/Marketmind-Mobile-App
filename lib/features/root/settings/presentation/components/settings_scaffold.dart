import 'package:marketmind/core/export/export.core.dart';
import 'package:marketmind/features/root/component/custom_app_bar.dart';

class SettingsScaffold extends StatelessWidget {
  const SettingsScaffold({super.key, this.title, required this.child});

  final Widget child;
  final String? title;

  @override
  Widget build(BuildContext context) {
    return BaseScaffold(
        horizontalPadding: 20,
        child: SafeArea(
            child: Column(
              children: [
                20.verticalSpace,
                CustomAppBar(
                  children: [
                    20.horizontalSpace,
                    if(title != null)
                      Text(title!,
                        style: context.textTheme.titleMedium?.copyWith(
                            color: AppColors.textBlack),)
                  ],
                ),
                20.verticalSpace,
              Expanded(child:   SingleChildScrollView(
                child: child,
              ))
              ],
            )));
  }
}