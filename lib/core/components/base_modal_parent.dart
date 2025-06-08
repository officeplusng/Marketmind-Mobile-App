import 'package:marketmind/core/export/export.core.dart';

class BaseModalParent extends StatelessWidget {
  const BaseModalParent(
      {super.key,
      required this.child,
      this.height,
      this.verticalPadding,
      this.horizontalPadding,
      this.header,
        this.scrollable=true,
      this.verticalMargin});

  final Widget child;
  final double? height;
  final double? horizontalPadding;
  final bool scrollable;
  final double? verticalMargin;
  final double? verticalPadding;
  final Widget? header;

  factory BaseModalParent.withDefaultHeader(
      {required String title,
      String closeButtonText = 'Close',
      void Function(BuildContext)? onClickCloseButton,
      required Widget child}) {
    return BaseModalParent(
        verticalMargin: 60,
        header: ModalHeader(
          title: title,
          endIconText: closeButtonText,
          onClickEndIcon: onClickCloseButton,
        ),
        child: child);
  }

  factory BaseModalParent.withCustomHeader(
      {Widget? startIcon,
      void Function(BuildContext)? onClickCloseButton,
      Widget? centerIcon,
      Widget? endIcon,
      required Widget child}) {
    return BaseModalParent(
        verticalMargin: 60,
        header: ModalHeader(
          startIcon: startIcon,
          centerIcon: centerIcon,
          endIcon: endIcon,
          onClickEndIcon: onClickCloseButton,
        ),
        child: child);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      decoration: ShapeDecoration(
        color: AppColors.white,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(Dimens.defaultBorderRadius)),
      ),
      margin:
          EdgeInsets.symmetric(horizontal: 20, vertical: verticalMargin ?? 40),
      constraints: const BoxConstraints(
        maxHeight: 600,
      ),
      width: MediaQuery.of(context).size.width,
      padding: EdgeInsets.symmetric(
          horizontal: horizontalPadding ?? 15, vertical: verticalPadding ?? 10),
      child:scrollable? SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            if (header != null) ...[
              10.verticalSpace,
              header!,
              20.verticalSpace,
            ],
            child
          ],
        ),
      ):Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          if (header != null) ...[
            10.verticalSpace,
            header!,
            20.verticalSpace,
          ],
          child
        ],
      ),
    );
  }

  static Widget modalPin() {
    return Center(
      child: Container(
        margin: EdgeInsets.only(bottom: 20),
        height: 4,
        width: 75,
        decoration: ShapeDecoration(
            color: Color(0XFFD0D5DD),
            shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(8))),
      ),
    );
  }
}

class ModalHeader extends StatelessWidget {
  const ModalHeader(
      {super.key,
      this.title,
      this.centerIcon,
      this.endIconText,
      this.endIcon,
      this.onClickEndIcon,
      this.startIcon});

  final String? title;
  final Widget? centerIcon;
  final Widget? endIcon;
  final String? endIconText;
  final Widget? startIcon;
  final void Function(BuildContext)? onClickEndIcon;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Builder(builder: (context) {
          if (startIcon != null) {
            return startIcon!;
          }
          if (title != null) {
            return Text(
              title!,
              style: context.textTheme.titleSmall,
            );
          }
          return SizedBox();
        }),
        Builder(builder: (context) {
          if (centerIcon != null) return centerIcon!;

          return SizedBox();
        }),
        Builder(builder: (_) {
          if (endIcon != null) {
            return endIcon!;
          }
          if (endIconText != null) {
            return GestureDetector(
              onTap: () {
                if (onClickEndIcon != null) {
                  onClickEndIcon?.call(context);
                  return;
                }
                context.popDialog();
              },
              child: Text(
                endIconText!,
                style: context.textTheme.bodyMedium?.copyWith(
                    fontWeight: FontWeight.w500, color: AppColors.red),
              ),
            );
          }
          return SizedBox();
        }),
      ],
    );
  }
}
