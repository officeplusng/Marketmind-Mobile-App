import 'package:marketmind/core/export/export.core.dart';
import 'package:marketmind/features/root/_ai_chat/presentation/modal/delete_conversation_modal.dart';

class ChatOptionModal extends StatelessWidget {
  const ChatOptionModal({super.key});

  @override
  Widget build(BuildContext context) {
    final options = [
      (Assets.globe1, 'English'),
      (Assets.share, 'Share conversation'),
      (Assets.rename, 'Rename conversation'),
      (Assets.favorite, 'Mark as favorite'),
      (Assets.clearConversation, 'Clear conversation')
    ];
    return BaseModalParent(
        horizontalPadding: 5,
        verticalMargin: 10,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            BaseModalParent.modalPin(),
            Text(
              'Conversation menu',
              style: context.textTheme.headlineMedium?.copyWith(fontSize: 20),
            ),
            20.verticalSpace,
            ListView.separated(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                padding: const EdgeInsets.all(0),
                itemBuilder: (_, index) {
                  final item = options[index];
                  return InkWell(
                    onTap: () {
                      if (item.$2.toLowerCase().contains('clear')) {
                        ModalHelper.showModalMax(
                            context,
                            const DeleteConversationModal(
                              clear: true,
                            ));
                        return;
                      }
                    },
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SvgPicture.asset(item.$1),
                        5.horizontalSpace,
                        Text(
                          item.$2,
                          style: context.textTheme.titleSmall
                              ?.copyWith(color: AppColors.textBlack),
                        ),
                        if (index == 0) ...[
                          Spacer(),
                          Icon(
                            Icons.keyboard_arrow_down_outlined,
                            color: AppColors.black,
                          )
                        ]
                      ],
                    ),
                  );
                },
                separatorBuilder: (_, a) => const Padding(
                      padding: EdgeInsets.symmetric(vertical: 10),
                      child: const Divider(
                        height: 10,
                        color: Color(0XFFF2F4F7),
                      ),
                    ),
                itemCount: options.length),
            10.verticalSpace,
            GestureDetector(
              onTap: () {
                ModalHelper.showModalMax(
                    context, DeleteConversationModal());
              },
              child: Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(16),
                  decoration: ShapeDecoration(
                      color: const Color(0XFFFEF3F2),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8))),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SvgPicture.asset(Assets.trash),
                      20.horizontalSpace,
                      Text('Delete',
                          style: context.textTheme.titleSmall
                              ?.copyWith(color: AppColors.red))
                    ],
                  )),
            )
          ],
        ));
  }
}
