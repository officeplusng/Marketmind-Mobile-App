import 'package:marketmind/core/export/export.core.dart';

class HomeInfoCard extends StatelessWidget {
  const HomeInfoCard(
      {super.key,
      required this.title,
      required this.subtitle,
      required this.buttonText,
      required this.backgroundAsset,
      this.subtitleColor,
      this.onClick,
      required this.buttonIcon});

  final String title;
  final String subtitle;
  final String backgroundAsset;
  final VoidCallback? onClick;
  final String buttonText;
  final Widget buttonIcon;

  final Color? subtitleColor;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onClick,
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.all(20),
        decoration: ShapeDecoration(
          image: DecorationImage(
              image: AssetImage(backgroundAsset), fit: BoxFit.cover),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        ),
        child: SizedBox(
          width: 200,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(title,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: context.textTheme.titleMedium?.copyWith(
                      fontWeight: FontWeight.w500,
                      color: AppColors.white,
                      fontSize: 20)),
              3.verticalSpace,
              Text(
                subtitle,
                style: context.textTheme.bodySmall?.copyWith(
                    fontWeight: FontWeight.w400,
                    color: subtitleColor ?? AppColors.defaultSubtitleHomeColor),
              ),
              20.verticalSpace,
              buttonInfo(context,buttonText,buttonIcon, onClick: onClick)
            ],
          ),
        ),
      ),
    );
  }

}

Widget buttonInfo(BuildContext context,String buttonText,Widget buttonIcon, {VoidCallback? onClick}) {
  return InkWell(
    onTap: onClick,
    radius: 999,
    child: Container(
      height: 32,
      constraints: const BoxConstraints(minWidth: 100),
      decoration: ShapeDecoration(
          color: AppColors.white,
          shape:
          RoundedRectangleBorder(borderRadius: BorderRadius.circular(999))),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          15.horizontalSpace,
          Text(
            buttonText,
            style: context.textTheme.bodyMedium?.copyWith(
                color: Colors.black, fontWeight: FontWeight.w600,fontSize: 14.5),
          ),
          10.horizontalSpace,
          buttonIcon,
          15.horizontalSpace,
        ],
      ),
    ),
  );
}
