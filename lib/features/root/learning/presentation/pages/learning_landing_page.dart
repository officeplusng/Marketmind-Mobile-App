import 'package:marketmind/core/export/export.core.dart';
import 'package:marketmind/src/state_management/cubit_state.dart';
import 'package:marketmind/core/components/loading_widget.dart';
import 'package:marketmind/features/root/learning/presentation/controllers/preparing_course_cubit.dart';
import 'package:marketmind/features/root/learning/data/dto/course_generation_progress_dto.dart';

class LearningLandingPage extends StatefulWidget {
  const LearningLandingPage({super.key});

  @override
  State<LearningLandingPage> createState() => _LearningLandingPageState();
}

class _LearningLandingPageState extends State<LearningLandingPage> {
  @override
  void initState() {
    super.initState();
    context.read<PreparingCourseCubit>().fetchCourseGenerationStatus();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<PreparingCourseCubit,
            BaseState<CourseStatsResponseDto>>(
        builder: (_, state) {
          return Scaffold(
            backgroundColor: const Color(0XFF0E101B),
            body: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const SizedBox(),
                Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const PageLoader(),
                    10.verticalSpace,
                    Text(
                      '${state.data?.stats.percent ?? 0}%',
                      style: const TextStyle(
                          fontSize: 16,
                          color: AppColors.white,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    10.verticalSpace,
                    Text(
                      '${state.data?.stats.phase??'Please wait'}...',
                      style: const TextStyle(fontSize: 18, color: AppColors.white),
                    ),
                    100.verticalSpace
                  ],
                )
              ],
            ),
          );
        },
        listener: (_, state) {

        });
  }
}
