import 'package:marketmind/features/_shared/controllers/cubit/account_cubit.dart';
import 'package:marketmind/features/_shared/data/dto/user_dto.dart';
import 'package:marketmind/features/root/settings/presentation/components/settings_input_field.dart';
import 'package:marketmind/features/root/settings/presentation/components/settings_scaffold.dart';
import 'package:marketmind/src/state_management/cubit_state.dart';
import 'package:marketmind/core/export/export.core.dart';

class PersonalInformationScreen extends StatefulWidget {
  const PersonalInformationScreen({super.key});

  @override
  State<PersonalInformationScreen> createState() =>
      _PersonalInformationScreenState();
}

class _PersonalInformationScreenState extends State<PersonalInformationScreen> {
  bool timeZoneToggle = true;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AccountCubit, BaseState<UserDto>>(
        builder: (context, state) {
      final data = state.data;
      final nameSplit = data?.fullname?.split(' ');
      return SettingsScaffold(
          title: 'Personal Information',
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Center(
                    child: SizedBox(
                      width: 100,
                      height: 100,
                      child: Stack(
                        alignment: Alignment.center,
                        children: [
                          SizedBox(
                            width: 80,
                            height: 80,
                            child: CircularProgressIndicator(
                              value: .7,
                              strokeWidth: 2.46,
                              color: AppColors.primary,
                            ),
                          ),
                          CircleAvatar(
                            radius: 35.51,
                            backgroundImage: data?.avatar == null
                                ? null
                                : NetworkImage(data?.avatar?.url ??
                                    AppConstants.placeHolder),
                            backgroundColor:
                                data?.avatar != null ? AppColors.primary : null,
                            child: data?.avatar != null
                                ? Text(
                                    '${nameSplit?.firstOrNull?.characters.firstOrNull ?? ''}${nameSplit?.lastOrNull?.characters.firstOrNull ?? ''}',
                                    style: context.textTheme.titleMedium
                                        ?.copyWith(color: AppColors.white),
                                  )
                                : null,
                          ),
                          Positioned(
                              bottom: -20,
                              right: -5,
                              child: GestureDetector(
                                onTap: () {},
                                child: SvgPicture.asset(
                                    SettingsAssets.profileEdit),
                              ))
                        ],
                      ),
                    ),
                  ),
                  20.verticalSpace,
                  Text(
                    'EKENE SMART',
                    style: context.textTheme.headlineSmall
                        ?.copyWith(color: AppColors.textBlack),
                  ),
                  10.verticalSpace,
                  Text(
                    'kariaki.ebilate@gmail.com',
                    style: context.textTheme.titleSmall
                        ?.copyWith(color: AppColors.textGray1),
                  )
                ],
              ),
              30.verticalSpace,
              SettingsInputField(
                label: 'Name',
                initialValue: data?.fullname,
              ),
              20.verticalSpace,
              SettingsInputField(
                label: 'Email',
                initialValue: data?.email,
                enable: false,
              ),
              20.verticalSpace,
              if (data?.phone != null)
                SettingsInputField(
                  label: 'Phone Number',
                  initialValue: data?.phone,
                ),
              20.verticalSpace,
              Divider(
                color: AppColors.gray,
              ),
              20.verticalSpace,
              Text(
                'Date & Time',
                style: context.textTheme.titleSmall
                    ?.copyWith(color: AppColors.textBlack),
              ),
              15.verticalSpace,
              Text(
                'Set timezone automatically using your location',
                style: context.textTheme.bodyMedium?.copyWith(
                    fontWeight: FontWeight.w500, color: AppColors.textBlack),
              ),
              10.verticalSpace,
              Row(
                children: [
                  Expanded(
                      child: Text(
                    'Reminders, notifications and emails are delivered based on your time zone',
                    style: context.textTheme.bodyMedium
                        ?.copyWith(color: AppColors.textGray1),
                  )),
                  20.horizontalSpace,
                  Switch(
                      value: timeZoneToggle,
                      activeColor: AppColors.primary,
                      activeTrackColor: AppColors.primary,
                      thumbColor: WidgetStateProperty.resolveWith((state) {
                        if (state.contains(WidgetState.selected)  ) {
                          return AppColors.white;
                        } else {
                          return AppColors.primary;
                        }
                      }),
                      onChanged: (value) => setState(() {
                            timeZoneToggle = value;
                          }))
                ],
              ),
              20.verticalSpace,
              Text(
                'Time Zone',
                style: context.textTheme.titleSmall
                    ?.copyWith(color: AppColors.textBlack),
              ),
              10.verticalSpace,
              Text(
                'Current time zone settings',
                style: context.textTheme.bodyMedium?.copyWith(
                    fontWeight: FontWeight.w500, color: AppColors.textBlack),
              ),
              20.verticalSpace,
              //todo time zone picker,
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
    });
  }
}
