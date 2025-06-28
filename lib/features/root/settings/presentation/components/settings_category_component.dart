import 'package:flutter/cupertino.dart';
import 'package:marketmind/core/export/export.core.dart';
import 'package:marketmind/core/util/dialog_helper.dart';
import 'package:marketmind/features/_shared/controllers/cubit/account_cubit.dart';
import 'package:marketmind/features/authentication/presentation/screens/login_screen.dart';
import 'package:marketmind/features/root/settings/domain/entity/settings_entity.dart';
import 'package:marketmind/features/root/settings/presentation/components/settings_item_component.dart';
import 'package:marketmind/features/root/settings/presentation/dialog.dart';
import 'package:marketmind/features/root/settings/presentation/modal/delete_account_modal.dart';
import 'package:marketmind/features/root/settings/presentation/modal/reset_ai_assistant_modal.dart';
import 'package:marketmind/features/root/settings/util/settings_route.dart';

class SettingsCategoryComponent extends StatelessWidget {
  const SettingsCategoryComponent({super.key, required this.category});

  final SettingsCategoryEntity category;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          category.category,
          style: context.textTheme.bodyMedium
              ?.copyWith(color: AppColors.textGray1),
        ),
        10.verticalSpace,
        ListView.separated(
            separatorBuilder: (_, index) => 10.verticalSpace,
            physics: const NeverScrollableScrollPhysics(),
            padding: const EdgeInsets.all(0),
            shrinkWrap: true,
            itemCount: category.settings.length,
            itemBuilder: (_, index) => SettingsItemComponent(
                  data: category.settings[index],
                  onClick: () {
                    final action = category.settings[index].action;
                    final route = category.settings[index].route;
                    if (route != null) {
                      context.push(SettingsRoutes.settingsRoute[route]!);
                    } else {
                      switch (action) {
                        case SettingsAction.navigate:
                          break;
                        case SettingsAction.logout:
                          DialogHelper.show(context, child: LogoutDialog());
                          // context.read<AccountCubit>().logout();
                          // context.pushRemoveUntil(LoginScreen());
                          break;
                        case SettingsAction.deleteAccount:
                          ModalHelper.showModalMax(
                              context, DeleteAccountModal());
                          break;
                        case SettingsAction.resetAIAssistant:
                          ModalHelper.showModalMax(
                              context, ResetAiAssistantModal());
                          throw UnimplementedError();
                      }
                    }
                  },
                ))
      ],
    );
  }
}
