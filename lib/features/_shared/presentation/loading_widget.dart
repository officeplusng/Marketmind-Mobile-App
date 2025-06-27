import 'package:flutter/cupertino.dart';
import 'package:marketmind/core/theme/app_colors.dart';

class LoadingWidget extends StatelessWidget {
  const LoadingWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: CupertinoActivityIndicator(
        color: AppColors.primary,
        radius: 24,
      )
    );
  }
}
