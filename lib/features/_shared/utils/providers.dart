import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:marketmind/features/_shared/controllers/cubit/account_cubit.dart';
import 'package:marketmind/features/_shared/controllers/cubit/candle_chart_cubit.dart';
import 'package:marketmind/features/_shared/controllers/cubit/news_cubit.dart';
import 'package:marketmind/features/authentication/_controller/cubit/onboarding_cubit.dart';
import 'package:marketmind/features/root/home/controllers/cubit/referral_cubit.dart';
import 'package:marketmind/features/root/home/controllers/cubit/trading_insight_cubit.dart';
import 'package:marketmind/features/root/home/controllers/cubit/watch_list_cubit.dart';

import '../../root/home/controllers/cubit/referral_dashboard_cubit.dart';
import '../controllers/cubit/search_asset_cubit.dart';

List<BlocProvider> providers = [
  BlocProvider<WatchListCubit>(create: (context) => WatchListCubit()),
  BlocProvider<NewsCubit>(create: (context) => NewsCubit()),
  BlocProvider<TradingInsightCubit>(create: (context) => TradingInsightCubit()),
  BlocProvider<AuthenticationCubit>(create: (context) => AuthenticationCubit()),
  BlocProvider<AccountCubit>(create: (context) => AccountCubit()),
  BlocProvider<ReferralDashboardCubit>(create: (context) => ReferralDashboardCubit()),
  BlocProvider<ReferralsCubit>(create: (context) => ReferralsCubit()),
  BlocProvider<AiInsightCubit>(create: (context) => AiInsightCubit()),
  BlocProvider<SearchAssetCubit>(create: (context) => SearchAssetCubit()),
  BlocProvider<CandleChartCubit>(create: (context) => CandleChartCubit()),
];
