import 'package:marketmind/core/export/export.core.dart';
import 'package:marketmind/core/helper/notify_helper.dart';
import 'package:marketmind/features/_shared/controllers/cubit/account_cubit.dart';
import 'package:marketmind/features/onboarding/components/selectable_component.dart';
import 'package:marketmind/features/root/learning/presentation/pages/learning_landing_page.dart';
import 'package:marketmind/src/state_management/cubit_state.dart';

import '../authentication/_controller/cubit/onboarding_questions_cubit.dart';
import '../authentication/data/dto/onboarding_answers_dto.dart';
import '../authentication/data/dto/onboarding_questions_dto.dart';
import 'components/onboarding_text_caption_component.dart';

class OnboardingOptionEntity {
  final String title;
  final String? subtitle;
  final int? limit;
  final bool radio;
  final void Function(List<SelectionEntity>)? onSelect;
  final String heading;
  final List<SelectionEntity> options;

  const OnboardingOptionEntity(
      {required this.title,
      this.subtitle,
      this.limit,
      this.onSelect,
      required this.heading,
      this.radio = false,
      required this.options});
}

class CompleteOnboardingScreen extends StatefulWidget {
  const CompleteOnboardingScreen({super.key, required this.pages});

  final List<OnboardingQuestionDto> pages;

  @override
  State<CompleteOnboardingScreen> createState() =>
      _CompleteOnboardingScreenState();
}

class _CompleteOnboardingScreenState extends State<CompleteOnboardingScreen> {
  final controller = PageController();

  int _currentPage = 0;
  final Map<int, List<String>> _answers = {};

  @override
  Widget build(BuildContext context) {
    final user = context.read<AccountCubit>().data;
    final pages = widget.pages
        .map((e) => OnboardingOptionEntity(
            radio: !e.isMultiple,
            title: e.question,
            heading: '',
            onSelect: (result) {
              setState(() {
                _answers[e.id] = result.map((e) => e.title).toList();
              });
            },
            options: e.options
                .map((option) =>
                    SelectionEntity(title: option.label, subtitle: option.text))
                .toList()))
        .toList();
    return Scaffold(
      backgroundColor: AppColors.white,
      body: Stack(
        children: [
          Image.asset(
            Assets.bgGradient,
            width: double.infinity,
            height: double.infinity,
          ),
          BlocConsumer<OnboardingQuestionsCubit,
              BaseState<List<OnboardingQuestionDto>>>(listener: (_, state) {
            if (state is SubmitOnboardingSuccess) {
              NotifyHelper.showSuccessToast('Questions submitted');
              context.pushRemoveUntil(LearningLandingPage());
              return;
            }
            if (state.isError) {
              NotifyHelper.showErrorToast(state.error ?? '');
            }
          }, builder: (_, state) {
            return SafeArea(
                child: PagePadding(
                    child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 20),
                  child: LinearProgressIndicator(
                    value: (_currentPage * pages.length / 100),
                    color: AppColors.primary,
                    backgroundColor: AppColors.white,
                    borderRadius:
                        BorderRadius.circular(Dimens.defaultBorderRadius),
                  ),
                ),
                OnboardingDataPage(data: pages[_currentPage]),
                Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    40.verticalSpace,
                    PrimaryButton.primary(
                      loading: state is SubmitOnboardingLoading,
                      text: _currentPage == widget.pages.length - 1
                          ? 'Submit'
                          : 'Next',
                      onPressed: () {
                        if (_currentPage < pages.length - 1) {
                          setState(() {
                            _currentPage++;
                          });
                          return;
                        }
                        if (_currentPage == widget.pages.length - 1) {
                          context
                              .read<OnboardingQuestionsCubit>()
                              .submitOnboardingQuestion(OnboardingAnswerDto(
                                  answers: AnswerDto.fromMap(_answers),
                                  userId: user?.id ?? 0));
                        }
                      },
                      iconEnd: const Icon(
                        Icons.arrow_forward,
                        color: AppColors.white,
                      ),
                    ),
                    10.verticalSpace,
                    if (_currentPage > 0)
                      PrimaryButton.light(
                        text: 'Back',
                        onPressed: () {
                          if (_currentPage > 0) {
                            setState(() {
                              _currentPage--;
                            });
                            return;
                          }
                        },
                        icon: const Icon(
                          Icons.arrow_back,
                        ),
                      ),
                  ],
                )
              ],
            )));
          })
        ],
      ),
    );
  }
}

class OnboardingDataPage extends StatelessWidget {
  const OnboardingDataPage({super.key, required this.data});

  final OnboardingOptionEntity data;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          OnboardingTextCaptionComponent(title: data.heading),
          30.verticalSpace,
          SelectableOptionComponent(
            options: data.options,
            radio: data.radio,
            title: data.title,
            subtitle: data.subtitle,
            limit: data.limit,
            onSelect: data.onSelect,
          )
        ],
      ),
    );
  }
}
