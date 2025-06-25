import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:marketmind/core/components/export.core.component.dart';

import '../../../../core/export/export.core.dart';
import '../../../root/learning/presentation/_components/input_field2.dart';

class SearchAssetDialog extends StatefulWidget {
  const SearchAssetDialog({super.key});

  @override
  State<SearchAssetDialog> createState() => _SearchAssetDialogState();
}

class _SearchAssetDialogState extends State<SearchAssetDialog>
    with SingleTickerProviderStateMixin {
  TabController? _tabController;

  final tabs = ["All", "Stock", "Crypto", "Forex"];

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
                     if(_text.isNotEmpty)
                       ...[  10.horizontalSpace,
                         IconButton(
                             onPressed: () {
                               _controller.clear();
                             },
                             icon: Icon(
                               Icons.close,
                               size: 14,
                               color: AppColors.black,
                             ))]
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
                         width:double.infinity,
                         padding: const EdgeInsets.symmetric(horizontal: 0),
                         decoration: ShapeDecoration(
                             color: const Color(0xFFF9FAFB),
                             shape: RoundedRectangleBorder(

                               side: BorderSide(color: Color(0XFFEAECF0)),
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
                       Text(
                         'TOP MATCHES',
                         style: context.textTheme.bodyMedium
                             ?.copyWith(color: AppColors.textGray1),
                       ),
                       20.verticalSpace,
                       ListView.separated(
                           shrinkWrap: true,
                           itemBuilder: (_, index) => _assetItem('Apple Inc.',
                               'AAPL', "Technology", "\$142.75", 1.5),
                           separatorBuilder: (_, a) => 10.verticalSpace,
                           itemCount: 3)
                     ],
                   )),
             ],
           ),

            Positioned(
              top: 20,
              left: 0,
              child: IconButton(onPressed: (){}, icon: SvgPicture.asset(Assets.closeIcon)),
            ),
          ],
        ));
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
        Row(
          children: [
            Expanded(
              child: Text(category,
                  style: context.textTheme.bodyMedium
                      ?.copyWith(color: AppColors.textGray1)),
            ),
            Text('${move > 0 ? '+' : '-'}$move%',
                style: context.textTheme.bodyMedium?.copyWith(
                    fontSize: 12,
                    color: move > 0 ? AppColors.green : AppColors.red)),
          ],
        ),
      ],
    );
  }
}
