import 'package:flutter/material.dart';
import 'package:marketmind/core/export/export.core.dart';

class AppCloseButton extends StatelessWidget {
  const AppCloseButton({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: () {
        context.pop();
      },
      shape: const CircleBorder(),
      height: 40,
      minWidth: 40,
      color: AppColors.socialGray,
      child: const Icon(
        size: 16,
        Icons.close,
        color: AppColors.white,
      ),
    );
  }
}
