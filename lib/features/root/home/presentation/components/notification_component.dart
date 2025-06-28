import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:marketmind/core/export/export.core.dart';
import 'package:marketmind/core/extension/date_time_extension.dart';

class NotificationComponent extends StatelessWidget {
  const NotificationComponent(
      {super.key,
      required this.asset,
      required this.title,
      required this.content,
      required this.time,
      this.isRead = false});

  final String asset;
  final String title;
  final String content;
  final DateTime time;
  final bool isRead;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: ShapeDecoration(
          color: isRead ? null : Color(0xFFF5F8FF),
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
              side: const BorderSide(color: Color(0XFFF2F4F7)))),
      padding: const EdgeInsets.all(12),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SvgPicture.asset(
            asset,
            width: 15,
            height: 15,
          ),
          10.horizontalSpace,
          Expanded(
              child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: context.textTheme.titleMedium
                    ?.copyWith(color: AppColors.textBlack),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
              3.verticalSpace,
              Text(
                content,
                style: context.textTheme.bodyMedium
                    ?.copyWith(color: AppColors.textGray1),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
              5.verticalSpace,
              Text(time.timeAgo(),
                  style: context.textTheme.bodyMedium?.copyWith(
                      color: AppColors.textGray1,
                      fontSize: 12,
                      fontStyle: FontStyle.italic))
            ],
          )),
          if (!isRead) ...[
            10.horizontalSpace,
            Icon(
              Icons.circle,
              color: AppColors.primary,
              size: 12,
            )
          ]
        ],
      ),
    );
  }
}
