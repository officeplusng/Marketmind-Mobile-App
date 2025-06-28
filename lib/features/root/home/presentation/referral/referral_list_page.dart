import 'package:marketmind/core/export/export.core.dart';
import 'package:marketmind/features/root/component/custom_app_bar.dart';
import '../../../../../src/state_management/cubit_state.dart';
import '../../../../_shared/presentation/base_shimmer.dart';
import '../../controllers/cubit/referral_cubit.dart';
import '../../data/dto/referral_dto.dart';
import '../components/home_app_bar_action_icon.dart';
import '../components/referral_component.dart';

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
        InputField.search(
          onChange: (value) {
            context.read<ReferralsCubit>().search(value);
          },
        ),
        20.verticalSpace,
        Expanded(
          child: BlocBuilder<ReferralsCubit, BaseState<List<ReferralDto>>>(
              builder: (_, state) {
            final data = state.data ?? [];
            if (state is LoadingState) {
              return const BaseShimmer(
                itemCount: 3,
                radius: 8,
                height: 90,
              );
            }
            return ListView.separated(
                shrinkWrap: true,
                itemBuilder: (_, index) => ReferralComponent(
                      data: data[index],
                    ),
                separatorBuilder: (_, _a) => 10.verticalSpace,
                itemCount: data.length > 5 ? 5 : data.length);
          }),
        )
      ],
    )));
  }
}
