import 'package:marketmind/core/export/export.core.dart';
import 'package:marketmind/features/onboarding/components/selectable_component.dart';
import 'package:marketmind/features/root/home/components/watch_list_component.dart';

import 'components/home_app_bar_action_icon.dart';

class CustomizeMarketData extends StatefulWidget {
  const CustomizeMarketData({super.key});

  @override
  State<CustomizeMarketData> createState() => _CustomizeMarketDataState();
}

class _CustomizeMarketDataState extends State<CustomizeMarketData> {
  @override
  Widget build(BuildContext context) {
    return BaseScaffold(
        child: SafeArea(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
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
                      onClick: () {},
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
               Expanded(child: SingleChildScrollView(
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
                     WatchListComponent(),
                     20.verticalSpace,
                     SelectableOptionComponent(
                         onSelect: (result){},
                         subtitle: 'Time Period for % Change',
                         options:const  [
                           SelectionEntity(title: '1 Hour'),
                           SelectionEntity(title: '4 Hour'),
                           SelectionEntity(title: '7 Hour'),
                           SelectionEntity(title: '30 Days'),
                         ]),
                     20.verticalSpace,

                     SelectableOptionComponent(
                         onSelect: (result){},
                         subtitle: 'Show Following Metrics',
                         options: const [
                           SelectionEntity(title: 'Percentage Change'),
                           SelectionEntity(title: 'Volume'),
                           SelectionEntity(title: 'Day Range'),
                           SelectionEntity(title: 'Market Cap'),
                         ]),
                     20.verticalSpace,

                     SelectableOptionComponent(
                         onSelect: (result){},
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
            )));
  }
}
