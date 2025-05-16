import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:marketmind/core/assets/assets.dart';
import 'package:marketmind/core/components/scaffold/gradient_scaffold.dart';
import 'package:marketmind/core/export/export.core.dart';
import 'package:marketmind/features/root/home/components/home_info_card.dart';

class HomeRoot extends StatefulWidget {
  const HomeRoot({super.key});

  @override
  State<HomeRoot> createState() => _HomeRootState();
}

class _HomeRootState extends State<HomeRoot> {
  @override
  Widget build(BuildContext context) {
    return GradientScaffold(
        backgroundAsset: '',
        horizontalPadding: 0,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _title('Learning Progress'),
            5.verticalSpace,
            HomeInfoCard(
                title: 'Intermediate Forex Strategies',
                subtitle: "Lesson 4 of 6: Support & Resistance Levels",
                buttonText: 'Continue',
                backgroundAsset: Assets.homeBackground1,
                buttonIcon: Icon(
                  Icons.arrow_forward_ios,
                  color: AppColors.black,
                  size: 14,
                )),
            20.verticalSpace,
            _title('Partner Program'),
            5.verticalSpace,
            HomeInfoCard(
                title: 'Your Referral Network',
                subtitle: "Track your referrals and earnings",
                buttonText: 'Earn commission',
                backgroundAsset: Assets.homeBackground2,
                subtitleColor: AppColors.defaultSubtitleHomeColor,
                buttonIcon: SvgPicture.asset(Assets.giftIcon)),
          ],
        ));
  }

  Widget _title(String text) =>
      Text(text, style: context.textTheme.titleSmall?.copyWith(
          color: AppColors.defaultButtonTextHomeColor),);
}
