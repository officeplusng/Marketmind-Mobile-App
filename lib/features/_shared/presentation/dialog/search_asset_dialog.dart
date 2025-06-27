import 'package:marketmind/core/export/export.core.dart';
import 'package:marketmind/features/_shared/presentation/loading_widget.dart';
import 'package:marketmind/features/root/learning/presentation/_components/input_field2.dart';
import 'package:marketmind/src/state_management/cubit_state.dart';
import 'package:marketmind/features/_shared/controllers/cubit/search_asset_cubit.dart';
import 'package:marketmind/features/_shared/data/dto/search_dto.dart';

import '../generic_empty_state.dart';

class SearchAssetDialog extends StatefulWidget {
  const SearchAssetDialog({super.key});

  @override
  State<SearchAssetDialog> createState() => _SearchAssetDialogState();
}

class _SearchAssetDialogState extends State<SearchAssetDialog>
    with SingleTickerProviderStateMixin {
  TabController? _tabController;

  final tabs = ["Stock", "Crypto", "Forex"];

  String _category = '';

  @override
  void initState() {
    _tabController = TabController(length: tabs.length, vsync: this);
    super.initState();
  }

  int _currentTab = 0;
  String _text = '';

  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SearchAssetCubit, BaseState<List<BestMatch>>>(builder: (context,state){

      return Container(
          width: double.infinity,
          height: double.infinity,
          padding: EdgeInsets.all(15),
          color: AppColors.black.withValues(alpha: .5),
          child: Stack(
            alignment: Alignment.center,
            children: [
              Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    padding: const EdgeInsets.all(12),
                    width: double.infinity,
                    constraints: const BoxConstraints(maxHeight: 385),
                    decoration: ShapeDecoration(
                        color: AppColors.white,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(16))),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Expanded(
                            child: Container(
                              padding: EdgeInsets.all(_text.isNotEmpty ? 1.5 : 0),
                              decoration: ShapeDecoration(
                                  color: const Color(0XFFF2F4F7),
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(8))),
                              child: InputField2(
                                controller: _controller,
                                inputType: TextInputType.text,
                                onSubmit: (value) {

                                  context.read<SearchAssetCubit>().search(value);
                                },
                                focusBorderColor: AppColors.primary,
                                hint: "Search for assets...",
                                prefix: const Icon(
                                  Iconsax.search_normal_1_copy,
                                  color: AppColors.textGray1,
                                ),
                                onChange: (value) {
                                  setState(() {
                                    _text = value;
                                  });
                                },
                              ),
                            )),
                        if (_text.isNotEmpty) ...[
                          10.horizontalSpace,
                          IconButton(
                              onPressed: () {
                                setState(() {
                                  _text = '';
                                });
                                _controller.clear();
                              },
                              icon: Icon(
                                Icons.close,
                                size: 14,
                                color: AppColors.black,
                              ))
                        ]
                      ],
                    ),
                  ),
                  20.verticalSpace,
                  Container(
                      padding: const EdgeInsets.all(16),
                      width: double.infinity,
                      constraints: const BoxConstraints(maxHeight: 385),
                      decoration: ShapeDecoration(
                          color: AppColors.white,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(16))),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            width: double.infinity,
                            padding: const EdgeInsets.symmetric(horizontal: 0),
                            decoration: ShapeDecoration(
                                color: const Color(0xFFF9FAFB),
                                shape: RoundedRectangleBorder(
                                  side:
                                  const BorderSide(color: Color(0XFFEAECF0)),
                                  borderRadius: BorderRadius.circular(8),
                                )),
                            child: TabBar(
                              controller: _tabController,
                              indicatorColor: AppColors.primary,
                              dividerColor: AppColors.transparent,
                              unselectedLabelColor: const Color(0xFF667085),
                              labelColor: const Color(0xFF344054),
                              isScrollable: false,
                              tabAlignment: TabAlignment.center,
                              labelStyle: context.textTheme.bodyMedium
                                  ?.copyWith(fontWeight: FontWeight.bold),
                              indicatorSize: TabBarIndicatorSize.tab,
                              indicatorPadding:
                              const EdgeInsets.symmetric(vertical: 5),
                              onTap: (value) {
                                setState(() {
                                  _currentTab = value;
                                  _category = tabs[value];
                                });
                              },
                              indicator: ShapeDecoration(
                                color: AppColors.white,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(6)),
                              ),
                              tabs: List.generate(tabs.length, (value) {
                                final e = tabs[value];
                                return Tab(
                                  text: e,
                                );
                              }),
                            ),
                          ),
                          20.verticalSpace,
                                if(  (state.data?.isNotEmpty ?? true) && state.isLoading==false)
                        ...[
                          Text(
                            'TOP MATCHES',
                            style: context.textTheme.bodyMedium
                                ?.copyWith(color: AppColors.textGray1),
                          ),
                          20.verticalSpace,
                          Expanded(child: ListView.separated(
                              shrinkWrap: true,
                              itemBuilder: (_, index) {
                                final items = state.data??[];
                                final item = items[index];
                                return  _assetItem(item.name??'',
                                    item.symbol??'', item.type??'', '', 1.5);
                              },
                              separatorBuilder: (_, a) => 10.verticalSpace,
                              itemCount: state.data?.length??0))
                        ],

                          if((state.data?.isEmpty??true) && state.isLoading==false)
                            GenericEmptyState(
                              title: 'No Result Found',
                              asset: Assets.searchEmptyState,
                              description:
                              "We couldn't find any matches for your search. Try using different keywords or check your spelling.",
                            )
                        ],
                      )),
                ],
              ),
              if(state.isLoading)
                LoadingWidget(),
              Positioned(
                top: 20,
                left: 0,
                child: IconButton(
                    onPressed: () {
                      context.popDialog();
                    },
                    icon: SvgPicture.asset(Assets.closeIcon)),
              ),
            ],
          ));
    });
  }

  Widget _assetItem(
      String name, String symbol, String category, String price, double move) {
    var titleSmall2 = context.textTheme.titleSmall;
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Row(
          children: [
            Expanded(
                child: Text.rich(TextSpan(
                    text: symbol,
                    style: titleSmall2?.copyWith(
                        fontWeight: FontWeight.w500, color: AppColors.black),
                    children: [
                  TextSpan(
                      text: name,
                      style: titleSmall2?.copyWith(
                          fontWeight: FontWeight.w400,
                          color: AppColors.textGray1))
                ]))),
            Text(price,
                style: titleSmall2?.copyWith(
                    fontWeight: FontWeight.w700, color: AppColors.black)),
          ],
        ),
        8.verticalSpace,
        // Row(
        //   children: [
        //     Expanded(
        //       child: Text(category,
        //           style: context.textTheme.bodyMedium
        //               ?.copyWith(color: AppColors.textGray1)),
        //     ),
        //     Text('${move > 0 ? '+' : '-'}$move%',
        //         style: context.textTheme.bodyMedium?.copyWith(
        //             fontSize: 12,
        //             color: move > 0 ? AppColors.green : AppColors.red)),
        //   ],
        // ),
      ],
    );
  }
}
