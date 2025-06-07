import 'package:marketmind/core/export/export.core.dart';
final content = '''
Technical Analysis forms the foundation of successful Forex trading. This comprehensive course will teach you how to identify and utilize Support & Resistance levels - one of the most powerful concepts in technical analysis. You'll learn to spot key price levels where market momentum typically changes direction, allowing you to make more informed trading decisions with higher probability outcomes.
Through practical examples and real-world market scenarios, you'll develop the skills to identify these crucial levels across different timeframes and currency pairs. By the end of this course, you'll understand how to incorporate Support & Resistance into your trading strategy to improve your entry points, determine optimal stop-loss placement, and set realistic profit targets.
''';
class CourseDetailsOverview extends StatelessWidget {
  const CourseDetailsOverview({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        20.verticalSpace,
        Text('Description',style: context.textTheme.titleMedium?.copyWith(color: AppColors.textBlack),),
        20.verticalSpace,
        Text(content,style: context.textTheme.bodyMedium?.copyWith(fontWeight: FontWeight.w500,color: AppColors.textGray1),),
        20.verticalSpace,
        _title(context,"What you'll learn"),
        20.verticalSpace,
        ...[
          'How to identify key Support & Resistance levels using multiple techniques',
          'Methods to validate the strength of Support & Resistance zones',
          'Strategies for trading bounces and breakouts at these critical levels',
          'Risk management techniques specifically for Support & Resistance trading',
          'How to combine Support & Resistance with other technical indicators',
          'Real-time market analysis using the concepts taught in this course'
        ].map((e)=>_whatYouWillLearn(e)),
        20.verticalSpace,

        _title(context,"This course includes:"),
        15.verticalSpace,
        ...[
          (Assets.video,' 4.5 hours on-demand video'),
          (Assets.caption,'Closed captions'),
          (Assets.document,'22 articles'),
          (Assets.crest,'Certificate of completion'),
          (Assets.downloadDocument,'12 downloadable resources'),
          (Assets.iphone,'Access on mobile and PC'),
          (Assets.chart,'6 practical trading simulations')

        ].map((e)=>_courseIncludes(text: e.$2,iconWidget: SvgPicture.asset(e.$1,color: AppColors.textBlack,))),
        20.verticalSpace,
        _title(context,"Requirements"),
        15.verticalSpace,
        ...[
          'Basic understanding of Forex market structure and terminology ',
          'Access to a charting platform (free options will be suggested in the course) ',
          'Completion of the "Beginner Forex Trading" course is recommended but not required'
        ].map((e){
          return Padding(padding: const EdgeInsets.symmetric(vertical: 5),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              5.horizontalSpace,
              const Icon(Icons.circle,color: AppColors.textGray1,size: 5,),
              5.horizontalSpace,
              Expanded(child: Text(e,style: context.textTheme.bodyMedium?.copyWith(fontWeight: FontWeight.bold,color: AppColors.textGray1),))
            ],
          ),);
        })
      ],
    );
  }


  Text _title(BuildContext context,String value) =>  Text(value,style: context.textTheme.titleMedium?.copyWith(color: AppColors.textBlack),);
  Widget _whatYouWillLearn(String text){
    return Builder(builder: (context){
      return Padding(padding: const EdgeInsets.symmetric(vertical: 5),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(Icons.check,color: AppColors.primary,),
          5.horizontalSpace,
         Expanded(child:  Text(text,style: context.textTheme.bodyMedium?.copyWith(fontWeight: FontWeight.w500,color: AppColors.textGray1),))

        ],
      ),);
    });
  }
  Widget _courseIncludes({ IconData? icon,Widget? iconWidget,required String text}){
    return Builder(builder: (context){
      return Padding(padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        children: [
          iconWidget??Icon(icon??Icons.circle,size: 15,),
          5.horizontalSpace,
          Text(text,style: context.textTheme.bodyMedium?.copyWith(color: AppColors.textGray1),)
        ],
      ),);
    });
  }
}
