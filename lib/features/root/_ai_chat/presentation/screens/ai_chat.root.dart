import 'package:marketmind/core/export/export.core.dart';
import 'package:marketmind/features/root/_ai_chat/presentation/modal/chat_option_modal.dart';
import 'package:marketmind/features/root/learning/presentation/_components/input_field2.dart';

import '../../../home/presentation/components/home_app_bar_action_icon.dart';

class AiChatScreen extends StatefulWidget {
  const AiChatScreen({super.key});

  @override
  State<AiChatScreen> createState() => _AiChatScreenState();
}

class _AiChatScreenState extends State<AiChatScreen> {
  final TextEditingController _controller = TextEditingController();

  String _text = '';

  @override
  Widget build(BuildContext context) {
    return BaseScaffold(
        child: SafeArea(
            child: Column(
      children: [
        20.verticalSpace,
        _header(context),
        10.verticalSpace,
        Expanded(
            child: Column(
          children: [_howCanIHelp()],
        )),
        10.verticalSpace,
        _chatBox(),
        10.verticalSpace,
        Text(
          'MarketMind learns from your interactions to better assist with your financial decisions.',
          textAlign: TextAlign.center,
          style:
              context.textTheme.bodySmall?.copyWith(color: AppColors.textGray1),
        ),
        20.verticalSpace,
      ],
    )));
  }

  Widget _chatBox() {
    return Row(
      children: [
        _roundButton(
            icon: const Icon(
              Icons.add,
              color: AppColors.white,
            ),
            onClick: () {}),
        10.horizontalSpace,
        Expanded(
            child: Container(
          padding: EdgeInsets.all(_text.isNotEmpty ? 1.5 : 0),
          decoration: ShapeDecoration(
              color: const Color(0XFFF2F4F7),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8))),
          child: InputField2(
            controller: _controller,
            hint: "Ask what's on your mind...",
            onChange: (value) {
              setState(() {
                _text = value;
              });
            },
          ),
        )),
        10.horizontalSpace,
        _roundButton(
            icon: SvgPicture.asset(
              _text.isEmpty ? Assets.mic : Assets.send,
              color: AppColors.white,
            ),
            onClick: () {})
      ],
    );
  }

  Widget _howCanIHelp() {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Image.asset(
          Assets.aiChatIcon,
          width: 44,
          height: 44,
        ),
        20.verticalSpace,
        Text('How can I help?',
            style: context.textTheme.headlineSmall
                ?.copyWith(color: AppColors.textBlack)),
        20.verticalSpace,
        Text(
          "I can provide personalized market insights, analyze your portfolio, or help you make informed investment decisions.",
          textAlign: TextAlign.center,
          style: context.textTheme.bodyMedium
              ?.copyWith(color: AppColors.textGray1),
        ),
        5.verticalSpace,
        Align(
          alignment: Alignment.centerLeft,
          child: Wrap(
            direction: Axis.horizontal,
            children: [
              ...[
                "Today's market trends",
                "Analyze my portfolio",
                "Generate investment report"
              ].map((e) => Container(
                    margin: const EdgeInsets.symmetric(vertical: 5),
                    padding:
                        const EdgeInsets.symmetric(vertical: 2, horizontal: 10),
                    decoration: ShapeDecoration(
                        color: const Color(0XFFF2F4F7),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(16))),
                    child: Text(
                      e,
                      style: context.textTheme.bodyMedium?.copyWith(
                          color: AppColors.textBlack,
                          fontWeight: FontWeight.bold),
                    ),
                  ))
            ],
          ),
        )
      ],
    );
  }

  Widget _roundButton(
      {required Widget icon, required void Function() onClick}) {
    return InkWell(
      onTap: onClick,
      radius: 999,
      child: Container(
        width: 38,
        decoration: ShapeDecoration(
            shape: const CircleBorder(), color: AppColors.primary),
        height: 38,
        alignment: Alignment.center,
        child: Center(
          child: icon,
        ),
      ),
    );
  }

  Widget _header(BuildContext context) {
    return Row(
      children: [
        HomeAppBarActionIcon(
          onClick: () {
            context.pop();
          },
          child: const Icon(
            Icons.arrow_back,
            size: 18,
          ),
        ),
        20.horizontalSpace,
        Expanded(child: Text(
          'A long title is always truncated, rest assured',
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: context.textTheme.titleSmall?.copyWith(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: AppColors.textBlack),
        )),
        20.horizontalSpace,
        HomeAppBarActionIcon(
          onClick: () {
            ModalHelper.showModalMax(context, ChatOptionModal());
          },
          child: const Icon(
            Icons.more_vert,
            size: 18,
          ),
        ),
      ],
    );
  }
}
