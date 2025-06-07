import 'package:marketmind/core/export/export.core.dart';
import 'package:marketmind/features/root/home/components/home_app_bar_action_icon.dart';
import 'package:marketmind/features/root/learning/presentation/_components/video_preview_component.dart';
import 'package:marketmind/features/root/learning/presentation/pages/tabs/course_details_faq.dart';
import 'package:marketmind/features/root/learning/presentation/pages/tabs/course_details_overview.dart';
import 'package:marketmind/features/root/learning/presentation/pages/tabs/course_details_quiz.dart';

class CourseDetailsScreen extends StatefulWidget {
  const CourseDetailsScreen({super.key});

  @override
  State<CourseDetailsScreen> createState() => _CourseDetailsScreenState();
}

class _CourseDetailsScreenState extends State<CourseDetailsScreen>   with SingleTickerProviderStateMixin {
  TabController? _tabController;

  final _tabs = ['Overview', 'FAQ','Quiz'];

  @override
  void initState() {
    _tabController = TabController(length: _tabs.length, vsync: this);
    super.initState();
  }

  int _currentTab = 0;
  @override
  Widget build(BuildContext context) {
    return BaseScaffold(
        child: SafeArea(
            child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        20.verticalSpace,
        _header(context),
       10.verticalSpace,
       Expanded(child: SingleChildScrollView(
         child:
         Column(
           crossAxisAlignment: CrossAxisAlignment.start,
           children: [
             20.verticalSpace,
             const VideoPreviewComponent(
                 url:
                 'https://assets.avancier.org/373bf8d3-525f-4033-b58f-2aa2f53e1d77/videos/d53358b7-e6cb-4898-ba21-0e5f68ff1d89/0192497d-9f62-4440-ad07-900fdcae086e.mp4'),
             Text(
               'Technical Analysis: Support & Resistance',
               style: context.textTheme.titleSmall
                   ?.copyWith(color: AppColors.textBlack, fontSize: 20),
             ),
             15.verticalSpace,
             Row(
               mainAxisAlignment: MainAxisAlignment.spaceBetween,
               children: [
                 buildRow(icon: Icons.play_circle_outline, text: '36 lessons'),
                 buildRow(icon: Icons.access_time_outlined, text: '4h 30min'),
                 buildRow(icon: Iconsax.document, text: '12 Assignments'),
               ],
             ),
             20.verticalSpace,

             TabBar(
               controller: _tabController,
               indicatorColor: AppColors.primary,
               unselectedLabelColor: AppColors.textGray1,
               labelColor: const Color(0xFF315BF3),
               onTap: (value){
                 setState(() {
                   _currentTab=value;
                 });
               },
               isScrollable: false,
               tabAlignment: TabAlignment.fill,
               labelStyle: context.textTheme.bodyMedium
                   ?.copyWith(fontWeight: FontWeight.bold),
               indicatorSize: TabBarIndicatorSize.tab,
               tabs: List.generate(_tabs.length, (value) {
                 final e = _tabs[value];
                 return Tab(
                   text: e,
                 );
               }),
             ),
             Builder(builder: (_){
               if(_currentTab==0) return const CourseDetailsOverview();
               if(_currentTab==1)return const CourseDetailsFaq();
               return const CourseDetailsQuiz();
             }),
             50.verticalSpace,
           ],
         ),
       ))
      ],
    )));
  }

  Row buildRow({required IconData icon, required String text}) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Icon(
          Icons.play_circle_outline,
          color: AppColors.primary,
          size: 13,
        ),
        5.horizontalSpace,
        Text(
          text,
          style: context.textTheme.titleSmall?.copyWith(
              fontWeight: FontWeight.w400, color: AppColors.textGray1),
        )
      ],
    );
  }

  Widget _header(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
        Text(
          'Course Detail',
          style: context.textTheme.titleSmall?.copyWith(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: AppColors.textBlack),
        ),
        HomeAppBarActionIcon(
          onClick: () {},
          child: const Icon(
            Icons.keyboard_arrow_down,
            size: 18,
          ),
        ),
      ],
    );
  }
}
