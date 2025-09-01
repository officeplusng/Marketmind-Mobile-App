import 'package:marketmind/core/di/injectable.dart';
import 'package:marketmind/core/network/api_result.dart';
import 'package:marketmind/features/root/learning/domain/repository/courses_repository.dart';
import 'package:marketmind/src/state_management/base_cubit.dart';
import 'package:marketmind/features/root/learning/data/dto/course_generation_progress_dto.dart';
import 'package:marketmind/src/state_management/cubit_state.dart';

class PreparingCourseCubit extends BaseCubit<CourseStatsResponseDto> {
  PreparingCourseCubit() : super(const InitialState()) {
    _repository = getIt<CoursesRepository>();
  }

  late CoursesRepository _repository;

  void fetchCourseGenerationStatus() async {
    int percentage = 0;
    while (percentage < 100) {
      final response = await _repository.getCourseGenerationStatus();
      if (response is Success<CourseStatsResponseDto>) {
        percentage = response.data.stats.percent;
        emitSuccess(data: response.data);
      }
      if (response is Failure<CourseStatsResponseDto>) {}
      await Future.delayed(const Duration(seconds: 10));
    }
  }
}
