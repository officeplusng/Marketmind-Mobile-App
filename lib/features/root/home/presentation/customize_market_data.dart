import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:marketmind/core/export/export.core.dart';
import 'package:marketmind/features/onboarding/components/selectable_component.dart';
import 'package:marketmind/features/root/home/data/dto/watch_list_dto.dart';
import 'package:marketmind/src/state_management/cubit_state.dart';

import '../../../_shared/presentation/base_shimmer.dart';
import '../controllers/cubit/trading_insight_cubit.dart';
import '../controllers/cubit/watch_list_cubit.dart';
import '../data/dto/trading_insight_data_dto.dart';
import 'components/home_app_bar_action_icon.dart';
import 'components/watch_list_component.dart';
import 'modal/market_data_modal.dart';

class CustomizeMarketData extends StatefulWidget {
  const CustomizeMarketData({super.key});

  @override
  State<CustomizeMarketData> createState() => _CustomizeMarketDataState();
}

class _CustomizeMarketDataState extends State<CustomizeMarketData> {
  List<AssetToWatch> watchList = [];

  @override
  void initState() {
    final state = context.read<AiInsightCubit>().state;
    watchList = state.data?.assetsToWatch ?? [];
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return BlocListener<AiInsightCubit,BaseState<MarketAnalysisData>>(listener: (_,state){
      if(state is SuccessState){
        setState(() {
          watchList=state.data?.assetsToWatch ?? [];
        });
      }
    },
    child: BaseScaffold(
        child: SafeArea(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                20.verticalSpace,
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    HomeAppBarActionIcon(
                      onClick: () {
                        context.pop();
                      },
                      child: const Icon(
                        Icons.arrow_back,
                        size: 18,
                      ),
                    ),
                    HomeAppBarActionIcon(
                      onClick: () {
                        ModalHelper.showModalMax(context, MarketDataModal());
                      },
                      child: const Icon(
                        Icons.info_outline,
                        size: 13,
                      ),
                    )
                  ],
                ),
                30.verticalSpace,
                Text(
                  'Customize Market Data',
                  style: context.textTheme.headlineMedium
                      ?.copyWith(color: AppColors.black),
                ),
                20.verticalSpace,
                Expanded(
                    child: SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          InputField.search(),
                          20.verticalSpace,
                          Text(
                            "Your Watchlists",
                            style: context.textTheme.titleMedium?.copyWith(
                                fontWeight: FontWeight.w500,
                                color: AppColors.defaultButtonTextHomeColor),
                          ),
                          5.verticalSpace,
                          Text(
                            'Add or remove assets from watchlist. Drag to reorder',
                            style: context.textTheme.bodyMedium
                                ?.copyWith(color: AppColors.textGray1),
                          ),
                          20.verticalSpace,
                          BlocBuilder<AiInsightCubit, BaseState<MarketAnalysisData>>(
                              builder: (context, state) {
                                if (state is LoadingState) {
                                  return const SizedBox(
                                    height: 100,
                                    child: BaseShimmer(
                                      height: 100,
                                      direction: Axis.horizontal,
                                      radius: 16,
                                    ),
                                  );
                                }
                                if (state is SuccessState) {

                                  return ListView.separated(
                                    separatorBuilder: (_, index) => 8.verticalSpace,
                                    shrinkWrap: true,
                                    physics: NeverScrollableScrollPhysics(),
                                    itemCount: watchList.length,
                                    itemBuilder: (context, index) {
                                      final data = watchList[index];
                                      return WatchListComponent(
                                        data: WatchListDto(
                                            asset: data.symbol ?? '',
                                            assetName: data.symbol ?? '',
                                            price: data.price?.toDouble() ?? 0,
                                            move: double.tryParse(
                                                data.change24h?.toStringAsFixed(3) ??
                                                    '') ??
                                                0),
                                        onClickDelete: () {
                                          setState(() {
                                            watchList.removeAt(index);
                                          });
                                        },
                                      );
                                    },
                                  );
                                }
                                return SizedBox();
                              }),
                          20.verticalSpace,
                          SelectableOptionComponent(
                              onSelect: (result) {},
                              subtitle: 'Time Period for % Change',
                              radio: true,
                              options: const [
                                SelectionEntity(title: '1 Hour'),
                                SelectionEntity(title: '4 Hour'),
                                SelectionEntity(title: '7 Hour'),
                                SelectionEntity(title: '30 Days'),
                              ]),
                          20.verticalSpace,
                          SelectableOptionComponent(
                              onSelect: (result) {},
                              radio: true,
                              subtitle: 'Show Following Metrics',
                              options: const [
                                SelectionEntity(title: 'Percentage Change'),
                                SelectionEntity(title: 'Volume'),
                                SelectionEntity(title: 'Day Range'),
                                SelectionEntity(title: 'Market Cap'),
                              ]),
                          20.verticalSpace,
                          SelectableOptionComponent(
                              onSelect: (result) {},
                              radio: true,
                              subtitle: 'Always show 3 assets on dashboard',
                              options: const [
                                SelectionEntity(title: 'Always show 3 assets on dashboard'),
                                SelectionEntity(title: 'Show all assets on dashboard'),
                                SelectionEntity(title: 'Show top performing assets'),
                              ]),
                          40.verticalSpace,
                          PrimaryButton.primary(
                            text: 'Save Changes',
                          ),
                          10.verticalSpace,
                          PrimaryButton.outlined(
                            text: 'Cancel',
                          ),
                          10.verticalSpace,
                          Center(
                            child: TextButton(
                                onPressed: () {},
                                child: Text(
                                  'Reset to Default',
                                  style: context.textTheme.titleSmall,
                                )),
                          )
                        ],
                      ),
                    ))
              ],
            ))),);
  }
}
