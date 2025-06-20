import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:marketmind/features/_shared/controllers/cubit/news_cubit.dart';
import 'package:marketmind/features/authentication/_controller/cubit/onboarding_cubit.dart';
import 'package:marketmind/features/root/home/controllers/cubit/trading_insight_cubit.dart';
import 'package:marketmind/features/root/home/controllers/cubit/watch_list_cubit.dart';

List<BlocProvider> providers = [
  BlocProvider<WatchListCubit>(create: (context) => WatchListCubit()),
  BlocProvider<NewsCubit>(create: (context) => NewsCubit()),
  BlocProvider<TradingInsightCubit>(create: (context) => TradingInsightCubit()),
  BlocProvider<AuthenticationCubit>(create: (context) => AuthenticationCubit()),
];
