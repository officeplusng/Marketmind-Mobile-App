import 'package:flutter/cupertino.dart';
import 'package:marketmind/core/export/export.core.dart';

class GenericEmptyState extends StatelessWidget {
  const GenericEmptyState(
      {super.key, required this.title, this.description, required this.asset});

  final String asset;

  final String title;
  final String? description;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SvgPicture.asset(asset,),
        20.verticalSpace,
        Text(
          title,
          textAlign: TextAlign.center,
          style: context.textTheme.titleMedium
              ?.copyWith(fontWeight: FontWeight.w600, color: AppColors.black),
        ),
        if (description != null) ...[
          10.verticalSpace,
          Text(
            description!,
            textAlign: TextAlign.center,
            style: context.textTheme.bodyMedium
                ?.copyWith(color: AppColors.textGray1),
          )
        ]
      ],
    );
  }
}
