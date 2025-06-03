import 'package:marketmind/core/export/export.core.dart';

import '../_components/trading_simulation_component.dart';
import '../_components/upgrade_learning_component.dart';

class LearningTradingSimulation extends StatefulWidget {
  const LearningTradingSimulation({super.key});

  @override
  State<LearningTradingSimulation> createState() =>
      _LearningTradingSimulationState();
}

class _LearningTradingSimulationState extends State<LearningTradingSimulation> {
  @override
  Widget build(BuildContext context) {
    return PagePadding(
        child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Trading Simulations',
          style:
              context.textTheme.titleMedium?.copyWith(color: AppColors.white),
        ),
        5.verticalSpace,
        Text(
          'Practice your trading strategies in a risk-free environment with AI-powered feedback',
          style: context.textTheme.bodyMedium?.copyWith(color: AppColors.white),
        ),
        10.verticalSpace,
        const UpgradeLearningComponent(
          actionText: 'Upgrade',
          content:
              'Complete Your Forex Journey. Upgrade to access premium learning modules, advanced trading simulations, and personalized AI mentoring.',
        ),
        20.verticalSpace,
        TradingSimulationComponent()
      ],
    ));
  }
}
