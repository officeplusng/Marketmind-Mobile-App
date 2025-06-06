import 'package:flutter/cupertino.dart';
import 'package:marketmind/core/export/export.core.dart';

class LearningVideoItemComponent extends StatelessWidget {
  const LearningVideoItemComponent(
      {super.key,
      required this.thumbnail,
      required this.title,
      required this.timeRemaining,
      this.percentageCompletion = 0});

  final String title;
  final String timeRemaining;
  final int percentageCompletion;

  final String thumbnail;

  @override
  Widget build(BuildContext context) {
    const url =
        'https://wpvip.edutopia.org/wp-content/uploads/2022/10/ray-rabadi-169hero-ugcclassroom-shutterstock.jpg?w=2880&quality=85';
    var roundedRectangleBorder =
        RoundedRectangleBorder(borderRadius: BorderRadius.circular(8));
    return Container(
      padding: const EdgeInsets.all(6),
      width: 252,
      margin: EdgeInsets.only(right: 10),
      decoration: ShapeDecoration(
          color: AppColors.white, shape: roundedRectangleBorder),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: 240,
            decoration: ShapeDecoration(
                image: const DecorationImage(
                    image: NetworkImage(url), fit: BoxFit.fill),
                shape: roundedRectangleBorder),
            height: 130,
            child: Center(
              child: Container(
                padding: EdgeInsets.all(5),
                decoration: ShapeDecoration(
                    shape: CircleBorder(), color: AppColors.grayDark),
                child: Icon(Icons.play_arrow),
              ),
            ),
          ),
          10.verticalSpace,
          Text(
            title,
            style: context.textTheme.titleSmall,
          ),
          15.verticalSpace,
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                timeRemaining,
                style: context.textTheme.bodyMedium,
              ),
              Text(
                '$percentageCompletion% Complete',
                style: context.textTheme.bodyMedium
                    ?.copyWith(color: AppColors.primaryDark),
              ),
            ],
          )
        ],
      ),
    );
  }
}
