import 'package:marketmind/core/export/export.core.dart';
class NewsOptionModal extends StatefulWidget {
  const NewsOptionModal({super.key, this.initialSelected, this.onSelected});

  final String? initialSelected;
  final void Function(String)? onSelected;

  @override
  State<NewsOptionModal> createState() => _NewsOptionModalState();
}

class _NewsOptionModalState extends State<NewsOptionModal> {
  String? selected;

  @override
  void initState() {
    selected = widget.initialSelected;
    super.initState();
  }

  final options = [
    'All',
    'bloomberg',
    'reuters',
    'cnbc',
    'financial-times',
    'the-wall-street-journal'
  ];

  @override
  Widget build(BuildContext context) {
    return BaseModalParent(
        horizontalPadding: 0,
        verticalPadding: 0,
        verticalMargin: 0,
        child: Column(
          children: [
            10.verticalSpace,
            Center(
              child: BaseModalParent.modalPin(margin: 5),
            ),
            20.verticalSpace,
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'News Sources',
                style: context.textTheme.titleSmall
                    ?.copyWith(color: AppColors.textBlack),
              ),
            ),
            20.verticalSpace,
            ...options.map((e) => Padding(
                  padding: const EdgeInsets.symmetric(vertical: 5),
                  child: InkWell(
                    onTap: () {
                      setState(() {
                        selected = e;
                      });
                      widget.onSelected?.call(e);
                      context.popDialog();
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          e.replaceAll('-', ' ').capitalizeFirstWord(),
                          style: context.textTheme.bodyMedium?.copyWith(
                              fontSize: 18,
                              color: selected == e
                                  ? AppColors.primary
                                  : AppColors.textBlack1),
                        ),
                        if (selected == e)
                          Icon(
                            Icons.check,
                            color: AppColors.primary,
                          )
                      ],
                    ),
                  ),
                )),
            30.verticalSpace,
            // PrimaryButton.minDark(
            //   text: 'Done',
            //   onPressed: () {
            //     if (selected == null) {
            //       return;
            //     }
            //     context.read<NewsCubit>().fetchNews(sources: selected!);
            //   },
            // )
          ],
        ));
  }
}
