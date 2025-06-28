import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:marketmind/core/assets/assets.dart';
import 'package:marketmind/core/export/export.core.dart';

import '../../data/dto/referral_dto.dart';

class ReferralComponent extends StatelessWidget {
  const ReferralComponent({super.key,required this.data});

  final ReferralDto data;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: ShapeDecoration(
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
              side: const BorderSide(width: 1, color: Color(0xFFEAECF0)))),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
              data.name??'',
                  style: context.textTheme.titleSmall
                      ?.copyWith(color: AppColors.defaultButtonTextHomeColor),
                ),
                Text(
                  '${data.earnings??''}',
                  style: context.textTheme.titleSmall
                      ?.copyWith(color: AppColors.defaultButtonTextHomeColor),
                )
              ],
            ),
          ),
          const Divider(
            color: Color(0xFFEAECF0),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                 data.joinDate??'',
                  style: context.textTheme.bodyMedium,
                ),
                5.horizontalSpace,
                _activeContainer(context, true),
                Spacer(),
                Text(
                  "Level ${data.levelNum??''}\t\t•",
                  style: context.textTheme.bodyMedium,
                ),
                Text(
                  "\t\t${data.level??''}",
                  style: context.textTheme.bodyMedium,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget _activeContainer(BuildContext context, bool active) => Container(
        height: 21,
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
        decoration: ShapeDecoration(
            color: active ? AppColors.greenLight1 : Color(0xFFFEF0C7),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16))),
        child: Text(
          active ? 'Active' : 'Pending',
          style: context.textTheme.bodySmall?.copyWith(
              color: active ? AppColors.textGreen : AppColors.yellowDark),
        ),
      );
}
