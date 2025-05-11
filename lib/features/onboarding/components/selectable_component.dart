import 'package:marketmind/core/export/export.core.dart';

class SelectionEntity {
  final String title;
  final String? subtitle;

  const SelectionEntity({required this.title, this.subtitle});
}

class SelectableComponent extends StatelessWidget {
  const SelectableComponent(
      {super.key,
      required this.title,
      required this.selected,
      this.onSelect,
      this.subtitle,
      this.radio = false});

  final String title;
  final String? subtitle;
  final bool selected;
  final bool radio;
  final void Function(bool?)? onSelect;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      splashColor: AppColors.transparent,
      child: Container(
        padding: subtitle == null
            ? null
            : (const EdgeInsets.symmetric(horizontal: 12, vertical: 8)),
        decoration: subtitle == null
            ? null
            : ShapeDecoration(
                shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(Dimens.defaultBorderRadius),
                side: BorderSide(
                    width: 1,
                    color: selected
                        ? AppColors.containerBackground1
                        : Colors.transparent),
              )),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            CheckOrRadio(
              selected: selected,
              radio: radio,
            ),
            10.horizontalSpace,
            Expanded(
                child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: context.textTheme.titleSmall
                      ?.copyWith(color: AppColors.white),
                ),
                if (subtitle != null) ...[
                  5.verticalSpace,
                  Text(
                    subtitle!,
                    style: context.textTheme.titleSmall?.copyWith(
                        color: AppColors.white, fontWeight: FontWeight.w500),
                  ),
                  5.verticalSpace
                ]
              ],
            ))
          ],
        ),
      ),
      onTap: () {
        onSelect?.call(!selected);
      },
    );
  }
}

class SelectableOptionComponent extends StatefulWidget {
  const SelectableOptionComponent(
      {super.key,
      required this.title,
      this.limit,
      required this.options,
      this.onSelect,
      this.radio = false});

  final String title;
  final bool radio;
  final int? limit;
  final List<SelectionEntity> options;
  final void Function(List<SelectionEntity>)? onSelect;

  @override
  State<SelectableOptionComponent> createState() =>
      _SelectableOptionComponentState();
}

class _SelectableOptionComponentState extends State<SelectableOptionComponent> {
  Set<SelectionEntity> selected = {};

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          widget.title,
          style: context.textTheme.headlineSmall
              ?.copyWith(fontWeight: FontWeight.w600),
        ),
        20.verticalSpace,
        ...List.generate(widget.options.length, (index) {
          final option = widget.options[index];
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 1),
            child: SelectableComponent(
              title: option.title,
              radio: widget.radio,
              subtitle: option.subtitle,
              selected: selected.contains(option),
              onSelect: (value) {
                if (value == null) {
                  return;
                }
                setState(() {
                  if (selected.contains(option)) {
                    selected.remove(option);
                    widget.onSelect?.call(selected.toList());
                    return;
                  }
                  if (widget.radio) {
                    selected = {option};
                    return;
                  }
                  if (widget.limit == selected.length) {
                    return;
                  }
                  selected.add(option);
                  widget.onSelect?.call(selected.toList());
                });
              },
            ),
          );
        })
      ],
    );
  }
}

class CheckOrRadio extends StatelessWidget {
  const CheckOrRadio({super.key, this.radio = false, required this.selected});

  final bool radio;
  final bool selected;

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(_getIcon());
  }

  String _getIcon() {
    if (selected) {
      return radio ? Assets.radioCheck : Assets.checkBoxCheck;
    }
    return radio ? Assets.radioUnChecked : Assets.checkBoxUncheck;
  }
}
