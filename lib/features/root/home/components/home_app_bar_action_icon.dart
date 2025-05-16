import 'package:flutter/cupertino.dart';
import 'package:marketmind/core/export/export.core.dart';

class HomeAppBarActionIcon extends StatelessWidget {
  const HomeAppBarActionIcon({super.key, required this.asset});

  final String asset;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){},
      child: Container(
        padding: const EdgeInsets.all(12),
        decoration:
        const ShapeDecoration(shape: CircleBorder(), color: AppColors.white),
        child: SvgPicture.asset(
          asset,
        ),
      ),
    );
  }
}
