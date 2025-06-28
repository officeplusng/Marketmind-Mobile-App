import 'package:marketmind/core/export/export.core.dart';
import 'package:marketmind/features/root/settings/presentation/components/settings_input_field.dart';

import '../../../_shared/controllers/cubit/account_cubit.dart';
import '../../../authentication/presentation/screens/login_screen.dart';

class LogoutDialog extends StatefulWidget {
  const LogoutDialog({super.key});

  @override
  State<LogoutDialog> createState() => _LogoutDialogState();
}

class _LogoutDialogState extends State<LogoutDialog> {
  final TextEditingController controller = TextEditingController();

  String _password = '';

  @override
  Widget build(BuildContext context) {
    return BaseDialogParent(
        verticalMargin: 0,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            20.verticalSpace,
            Text(
              'Logout',
              style: context.textTheme.titleMedium
                  ?.copyWith(color: AppColors.textBlack),
            ),
            20.verticalSpace,
            Text(
              'Are you sure you want to logout?',
              style: context.textTheme.bodyMedium?.copyWith(
                  color: AppColors.textGray1, fontWeight: FontWeight.w500),
            ),
            10.verticalSpace,
            20.verticalSpace,
            Row(
              children: [
                Expanded(
                    child: PrimaryButton.outlined(
                      onPressed: (){
                        context.popDialog();
                      },
                      text: 'Cancel',
                    )),
                20.horizontalSpace,
                Expanded(
                    child: PrimaryButton.primary(
                      onPressed: (){

                        context.read<AccountCubit>().logout();
                        context.pushRemoveUntil(LoginScreen());
                      },
                      color:  AppColors.red,
                      text: 'Logout',
                    )),
              ],
            ),
            20.verticalSpace
          ],
        ));
  }
}
