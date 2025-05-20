import 'package:marketmind/features/root/home/components/referral_component.dart';

import '../../../../core/export/export.core.dart';
import '../../../../core/theme/app_colors.dart';
import '../../component/custom_app_bar.dart';
import '../components/home_app_bar_action_icon.dart';

class ReferralListPage extends StatefulWidget {
  const ReferralListPage({super.key});

  @override
  State<ReferralListPage> createState() => _ReferralListPageState();
}

class _ReferralListPageState extends State<ReferralListPage> {
  @override
  Widget build(BuildContext context) {
    return BaseScaffold(
        child: SafeArea(
            child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomAppBar(
          action: [
            HomeAppBarActionIcon(
              onClick: () {},
              child: const Icon(
                Icons.filter_alt_outlined,
                size: 20,
              ),
            )
          ],
        ),
        20.verticalSpace,
        Text(
          'Referrals',
          style: context.textTheme.headlineMedium,
        ),
        20.verticalSpace,
        InputField.search(),
        20.verticalSpace,
        Expanded(child:
        ListView.builder(
          shrinkWrap: true,
          itemBuilder: (context, index) => Padding(padding: EdgeInsets.symmetric(vertical: 5),
            child: ReferralComponent(),),
          itemCount: 20,
        ))
      ],
    )));
  }
}
