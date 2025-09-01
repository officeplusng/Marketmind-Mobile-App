import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:marketmind/features/_shared/controllers/cubit/account_cubit.dart';
import 'package:marketmind/features/_shared/controllers/cubit/candle_chart_cubit.dart';
import 'package:marketmind/features/_shared/controllers/cubit/news_cubit.dart';
import 'package:marketmind/features/authentication/_controller/cubit/onboarding_cubit.dart';
import 'package:marketmind/features/root/home/controllers/cubit/referral_cubit.dart';
import 'package:marketmind/features/root/home/controllers/cubit/trading_insight_cubit.dart';
import 'package:marketmind/features/root/home/controllers/cubit/watch_list_cubit.dart';
import 'package:marketmind/features/root/learning/presentation/controllers/quiz_cubit.dart';
import 'package:marketmind/features/root/home/controllers/cubit/referral_dashboard_cubit.dart';
import 'package:marketmind/features/root/learning/presentation/controllers/achievement_cubit.dart';
import 'package:marketmind/features/_shared/controllers/cubit/search_asset_cubit.dart';
import 'package:marketmind/features/root/learning/presentation/controllers/badge_cubit.dart';
import 'package:marketmind/features/root/learning/presentation/controllers/certificate_cubit.dart';
import 'package:marketmind/features/root/learning/presentation/controllers/lesson_cubit.dart';
import 'package:marketmind/features/authentication/_controller/cubit/onboarding_questions_cubit.dart';
import 'package:marketmind/features/root/learning/presentation/controllers/preparing_course_cubit.dart';

List<BlocProvider> providers = [
  BlocProvider<PreparingCourseCubit>(create: (context) => PreparingCourseCubit()),
  BlocProvider<OnboardingQuestionsCubit>(create: (context) => OnboardingQuestionsCubit()),
  BlocProvider<LessonCubit>(create: (context) => LessonCubit()),
  BlocProvider<AchievementsCubit>(create: (context) => AchievementsCubit()),
  BlocProvider<CertificateCubit>(create: (context) => CertificateCubit()),
  BlocProvider<UserBadgeCubit>(create: (context) => UserBadgeCubit()),
  BlocProvider<WatchListCubit>(create: (context) => WatchListCubit()),
  BlocProvider<QuizCubit>(create: (context) => QuizCubit()),
  BlocProvider<AchievementsCubit>(create: (context) => AchievementsCubit()),
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
