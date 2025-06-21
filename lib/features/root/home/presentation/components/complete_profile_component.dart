import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:marketmind/core/export/export.core.dart';
import 'package:marketmind/features/_shared/controllers/cubit/account_cubit.dart';
import 'package:marketmind/features/_shared/data/dto/user_dto.dart';
import 'package:marketmind/features/root/settings/presentation/screens/personal_information_screen.dart';
import 'package:marketmind/src/state_management/cubit_state.dart';

class CompleteProfileComponent extends StatelessWidget {
  const CompleteProfileComponent({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AccountCubit, BaseState<UserDto>>(builder: (context,state){

      final data = state.data;
      final nameSplit = data?.fullname?.split(' ');
      return Container(
        padding: const EdgeInsets.all(16),
        decoration: ShapeDecoration(
            color: const Color(0xFFEAEDFE),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
                side: const BorderSide(width: 1, color: Color(0xFFBFCDFB)))),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      'Complete your account setup',
                      style: context.textTheme.titleMedium
                          ?.copyWith(color: const Color(0xFF152766)),
                    ),
                    5.verticalSpace,
                    Text(
                      'Complete your profile to unlock personalized AI trading insights',
                      style: context.textTheme.bodyMedium
                          ?.copyWith(color: const Color(0xFF1B3286)),
                    ),
                  ],
                )),
                20.horizontalSpace,
                Stack(
                  alignment: Alignment.center,
                  children: [
                    SizedBox(
                      width: 64,
                      height: 64,
                      child: CircularProgressIndicator(
                        value: .7,
                        strokeWidth: 2.46,
                        color: AppColors.primary,
                      ),
                    ),
                    CircleAvatar(
                      radius: 25.51,
                      backgroundImage: data?.avatar == null
                          ? null
                          : NetworkImage(
                          data?.avatar?.url ?? AppConstants.placeHolder),
                      backgroundColor:
                      data?.avatar != null ? AppColors.primary : null,
                      child: data?.avatar != null
                          ? Text(
                        '${nameSplit?.firstOrNull?.characters.firstOrNull ?? ''}${nameSplit?.lastOrNull?.characters.firstOrNull ?? ''}',
                        style: context.textTheme.titleMedium
                            ?.copyWith(color: AppColors.white),
                      )
                          : null,
                    )
                  ],
                )
              ],
            ),
            20.verticalSpace,
            button(context)
          ],
        ),
      );
    });
  }

  Widget button(BuildContext context) => GestureDetector(
    onTap: (){
      context.push(PersonalInformationScreen());
    },
    child: Container(
      height: 36,
      padding: const EdgeInsets.symmetric(horizontal: 14),
      decoration: ShapeDecoration(
          color: AppColors.primary,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(999))),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            'Complete now',
            style: context.textTheme.bodyMedium
                ?.copyWith(fontWeight: FontWeight.w600, color: AppColors.white),
          )
        ],
      ),
    ),
  );
}
