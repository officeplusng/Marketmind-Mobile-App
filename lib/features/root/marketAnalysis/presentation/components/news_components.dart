import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:marketmind/core/export/export.core.dart';
import 'package:marketmind/core/extension/date_time_extension.dart';
import 'package:marketmind/features/_shared/controllers/cubit/news_cubit.dart';
import 'package:marketmind/features/_shared/data/dto/new_dto.dart';
import 'package:marketmind/features/_shared/presentation/base_shimmer.dart';
import 'package:marketmind/src/state_management/cubit_state.dart';

class NewsComponents extends StatefulWidget {
  const NewsComponents({super.key});

  @override
  State<NewsComponents> createState() => _NewsComponentsState();
}

class _NewsComponentsState extends State<NewsComponents>
    with SingleTickerProviderStateMixin {
  TabController? _tabController;

  final tabs = ["All", "Market", "Economy", "Earning"];

  @override
  void initState() {
    _tabController = TabController(length: tabs.length, vsync: this);
    super.initState();
  }

  int _currentTab = 0;
  String _category = '';

  @override
  Widget build(BuildContext context) {
    var bodyMedium = context.textTheme.bodyMedium;
    return WrapperContainer.rectangular(
        width: double.infinity,
        useHeight: false,
        backgroundColor: AppColors.white,
        borderColor: const Color(0xFFF2F4F7),
        padding: const EdgeInsets.all(16),
        bordered: true,
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SvgPicture.asset(Assets.paperClip),
                    5.horizontalSpace,
                    Text(
                      'Market News',
                      style: bodyMedium?.copyWith(
                          fontWeight: FontWeight.w700,
                          color: AppColors.textBlack),
                    )
                  ],
                ),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SvgPicture.asset(Assets.globe),
                    8.horizontalSpace,
                    Text(
                      'US Markets',
                      style: bodyMedium?.copyWith(color: AppColors.primary),
                    ),
                    8.horizontalSpace,
                    SvgPicture.asset(Assets.vector)
                  ],
                )
              ],
            ),
            10.verticalSpace,
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 0),
              decoration: ShapeDecoration(
                  color: const Color(0xFFF9FAFB),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                      side: const BorderSide(
                          width: 1, color: Color(0xFFEAECF0)))),
              child: TabBar(
                controller: _tabController,
                indicatorColor: AppColors.primary,
                dividerColor: AppColors.transparent,
                unselectedLabelColor: const Color(0xFF667085),
                labelColor: const Color(0xFF344054),
                isScrollable: true,
                tabAlignment: TabAlignment.center,
                labelStyle: context.textTheme.bodyMedium
                    ?.copyWith(fontWeight: FontWeight.bold),
                indicatorSize: TabBarIndicatorSize.tab,
                indicatorPadding: const EdgeInsets.symmetric(vertical: 5),
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
            10.verticalSpace,
            BlocBuilder<NewsCubit, BaseState<List<NewsDto>>>(builder: (context, state) {
              if (state is LoadingState<List<NewsDto>>) {
                print('data-result -> ${state.data}');
                return const BaseShimmer(
                  height: 60,
                  itemCount: 6,
                );
              }
              if (state is SuccessState<List<NewsDto>>) {
                final data = (state.data ?? []).where((e) {
                  String value = _currentTab == 0 ? '' : _category;
                  return e.category?.toLowerCase().contains(value.toLowerCase()) ?? false;
                }).toList();
                return ListView.separated(
                  itemCount: data.length,
                  padding: const EdgeInsets.all(0),
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemBuilder: (_, index) => NewsItemComponent(
                    data: data[index],
                  ),
                  separatorBuilder: (_, index) => 10.verticalSpace,
                );
              }
              return const SizedBox(
                height: 100,
              );
            })
          ],
        ));
  }
}

class NewsItemComponent extends StatelessWidget {
  const NewsItemComponent({super.key, required this.data});

  final NewsDto data;

  @override
  Widget build(BuildContext context) {
    return WrapperContainer.rectangular(
        width: double.infinity,
        useHeight: false,
        backgroundColor: AppColors.white,
        borderColor: const Color(0xFFF2F4F7),
        padding: const EdgeInsets.all(16),
        bordered: true,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Text(
                  data.source?.toString() ?? '',
                  style: context.textTheme.bodySmall?.copyWith(
                      color: AppColors.textGray1, fontWeight: FontWeight.w500),
                ),
                10.horizontalSpace,
                const Icon(
                  Icons.access_time_sharp,
                  color: AppColors.textGray1,
                  size: 14,
                ),
                2.5.horizontalSpace,
                Text(
                  data.time?.timeAgo() ?? '',
                  style: context.textTheme.bodySmall?.copyWith(
                      color: AppColors.textGray1, fontWeight: FontWeight.w500),
                ),
                10.horizontalSpace,
              ],
            ),
            15.verticalSpace,
            Text(
              data.title,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: context.textTheme.titleSmall
                  ?.copyWith(color: AppColors.textBlack),
            ),
            5.verticalSpace,
            Text(
              data.content,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: context.textTheme.bodyMedium
                  ?.copyWith(color: AppColors.textGray1),
            ),
            20.verticalSpace,
            Row(
              children: [
                Icon(
                  Icons.bookmark_outline,
                  color: AppColors.textGray1,
                  size: 18,
                ),
                15.horizontalSpace,
                Icon(
                  Icons.share_outlined,
                  color: AppColors.textGray1,
                  size: 18,
                )
              ],
            ),
            16.verticalSpace,
            Row(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  'Read more',
                  style: context.textTheme.bodyMedium?.copyWith(
                      fontWeight: FontWeight.w500,
                      color: AppColors.primary,
                      fontSize: 12),
                ),
                5.horizontalSpace,
                Icon(
                  Icons.keyboard_arrow_right,
                  color: AppColors.primary,
                  size: 18,
                )
              ],
            )
          ],
        ));
  }
}
