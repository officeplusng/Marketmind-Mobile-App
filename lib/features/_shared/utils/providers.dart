import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:marketmind/features/root/home/controllers/cubit/trading_insight_cubit.dart';
import 'package:marketmind/features/root/home/controllers/cubit/watch_list_cubit.dart';

List<BlocProvider> providers = [
  BlocProvider<WatchListCubit>(create: (context) => WatchListCubit()),
  BlocProvider<TradingInsightCubit>(create: (context) => TradingInsightCubit()),
];
