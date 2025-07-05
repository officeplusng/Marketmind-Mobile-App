import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:marketmind/core/components/scaffold/gradient_scaffold.dart';
import 'package:marketmind/core/export/export.core.dart';
import 'package:marketmind/core/util/event_bus.dart';
import 'package:marketmind/features/_shared/controllers/cubit/account_cubit.dart';
import 'package:marketmind/features/_shared/controllers/cubit/candle_chart_cubit.dart';
import 'package:marketmind/features/_shared/controllers/cubit/news_cubit.dart';
import 'package:marketmind/features/authentication/presentation/screens/login_screen.dart';
import 'package:marketmind/features/root/_ai_chat/presentation/screens/ai_chat.root.dart';
import 'package:marketmind/features/root/component/app_bottom_nav.dart';
import 'package:marketmind/features/root/home/controllers/cubit/trading_insight_cubit.dart';
import 'package:marketmind/features/root/home/controllers/cubit/watch_list_cubit.dart';
import 'package:marketmind/features/root/learning/presentation/learning.root.dart';
import 'package:marketmind/features/root/marketAnalysis/presentation/market_analysis.root.dart';
import 'package:marketmind/features/root/settings/presentation/settings.root.dart';
import 'package:marketmind/src/state_management/cubit_state.dart';

import '../../../core/events/refresh_token_event_bus.dart';
import '../../_shared/data/enum/time_frame.dart';
import '../home/data/dto/watch_list_model.dart';
import '../home/presentation/home.root.dart';

class RootScreen extends StatefulWidget {
  const RootScreen({super.key});

  @override
  State<RootScreen> createState() => _RootScreenState();
}

class _RootScreenState extends State<RootScreen> {
  int _currentIndex = 0;

  @override
  void initState() {
    context.read<AccountCubit>().refresh();
    context.read<WatchListCubit>().init();
    context.read<TradingInsightCubit>().fetchTradingInsight();
    context.read<AiInsightCubit>().generateAISpotLight();
    context.read<NewsCubit>().fetchNews();
    super.initState();
    eventBus.on<RefreshTokenEventBus>().listen((event) {
      context.pushRemoveUntil(LoginScreen());
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<WatchListCubit, BaseState<List<WatchListModel>>>(
      listener: (_, state) {
        if (state.isSuccess) {
          final watchListSymbols = state.data
                  ?.map((e) => e.symbols?.toUpperCase() ?? 'EURUSD')
                  .toList() ??
              [];
          if (watchListSymbols.isNotEmpty) {
            context
                .read<AiInsightCubit>()
                .generateAISpotLight(symbols: watchListSymbols);
          }
        }
      },
      child: BaseScaffold(
          bottomWidget: AppBottomNav(
              items: [
                'home_unselected'.svg,
                'page2'.svg,
                'page3'.svg,
                'page5'.svg,
                'page4'.svg,
              ],
              currentIndex: _currentIndex,
              onItemChange: (value) => setState(() {
                    _currentIndex = value;
                  })),
          horizontalPadding: 0,
          child: IndexedStack(
            index: _currentIndex,
            children: [
              HomeRoot(),
              MarketAnalysis(),
              LearningRoot(),
              AiChatScreen(),
              SettingsRoot(
                isRoot: true,
              )
            ],
          )),
    );
  }
}
