import 'package:marketmind/core/export/export.core.dart';

class DeleteConversationModal extends StatelessWidget {
  const DeleteConversationModal(
      {super.key, this.clear = false, this.conversationName});

  final bool clear;
  final String? conversationName;

  @override
  Widget build(BuildContext context) {
    var copyWith = context.textTheme.titleSmall
        ?.copyWith(fontWeight: FontWeight.w400, color: AppColors.textGray1);
    return BaseModalParent(
        horizontalPadding: 5,
        verticalMargin: 10,
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          BaseModalParent.modalPin(),
          Text(
            "${clear ? "Clear" : "Delete"} conversation",
            style: context.textTheme.headlineMedium?.copyWith(fontSize: 20),
          ),
          20.verticalSpace,
          Text(
            "Are you sure you want to ${clear ? "permanently clear" : "delete"} ${conversationName ?? "Today's market analysis"} ${clear ? "conversation history" : ""}?",
            style: copyWith,
          ),
          20.verticalSpace,
          Text(
            "This action cannot be undone.",
            style: copyWith,
          ),
          20.verticalSpace,
          Row(
            children: [
              Expanded(
                  child: PrimaryButton.outlined(
                text: 'Cancel',
              )),
              20.horizontalSpace,
              Expanded(
                  child: PrimaryButton.primary(
                text: 'Delete',
                color: clear ? const Color(0XFF315BF3) : AppColors.red,
              ))
            ],
          ),
        ]));
  }
}
