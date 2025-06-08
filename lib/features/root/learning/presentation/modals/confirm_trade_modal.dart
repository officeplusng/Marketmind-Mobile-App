import 'package:marketmind/core/export/export.core.dart';

class ConfirmTradeModal extends StatelessWidget {
  const ConfirmTradeModal({super.key});

  @override
  Widget build(BuildContext context) {
    final textStyle = context.textTheme.titleSmall;
    var copyWith = context.textTheme.titleSmall?.copyWith(
      fontWeight: FontWeight.w500,
    );
    var copyWith2 = context.textTheme.titleSmall
        ?.copyWith(fontWeight: FontWeight.w400, color: AppColors.textGray1);
    return BaseModalParent(
        horizontalPadding: 5,
        verticalMargin: 10,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            BaseModalParent.modalPin(),
            Text(
              'Confirm Your Trade',
              style: context.textTheme.headlineMedium?.copyWith(fontSize: 20),
            ),
            20.verticalSpace,
            _tradeSummaryContainer(textStyle),
            15.verticalSpace,
            Row(
              children: [
                Expanded(child: _configuration(title: 'Stop', value: '1.0780', pips: 35, risk: '\$35.00')),
                15.horizontalSpace,
                Expanded(child: _configuration(red:false,title: 'Stop', value: '1.0780', pips: 35, risk: '\$35.00')),
              ],
            ),
            15.verticalSpace,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Risk-Reward Ratio',
                  style: copyWith2,
                ),
                Text(
                  '1:1.00',
                  style: copyWith,
                )
              ],
            ),
            5.verticalSpace,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Account Risk',
                  style: copyWith2,
                ),
                Text(
                  '0.4%',
                  style: copyWith,
                )
              ],
            ),
            30.verticalSpace,
            Row(
              children: [
                Expanded(
                    child: PrimaryButton.outlined(
                      onPressed: (){
                        context.pop();}
                      ,
                  text: 'Cancel',
                )),
                20.horizontalSpace,
                Expanded(
                    child: PrimaryButton.primary(
                  text: 'Confirm & Execute',
                  color: AppColors.buttonGreen,
                  onPressed: () {
                    context.pop();
                  },
                ))
              ],
            ),
            20.verticalSpace,
          ],
        ));
  }

  Widget _configuration(
      {bool red = true,
      required String title,
      required String value,
      required int pips,
      required String risk}) {
    return Builder(builder: (context) {
      var copyWith = context.textTheme.bodyMedium
                ?.copyWith(color: red ? AppColors.red : AppColors.greenDark);
      return WrapperContainer.rectangular(
        useHeight: false,
          borderRadius: 8,
          padding: const EdgeInsets.all(8),
          useWidth: false,
          backgroundColor: red?AppColors.redLight:Color(0XFFECFDF3),
          child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(),
          Text(
            red ? 'Stop Loss' : 'Take Profit',
            style: copyWith,
          ),
          5.verticalSpace,
          Text(
          value,
            style: copyWith,
          ),
          5.verticalSpace,
          Text(
          '$pips pips',
            style: copyWith,
          ),
          5.verticalSpace,
          Text(
            'Risk: $risk',
            style: copyWith,
          ),
          5.verticalSpace,
        ],
      ));
    });
  }

  Widget _tradeSummaryContainer(TextStyle? textStyle) {
    return WrapperContainer.rectangular(
        useWidth: false,
        useHeight: false,
        backgroundColor: const Color(0XFFF5F8FF),
        padding: EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Trade Summary',
              style: textStyle?.copyWith(fontWeight: FontWeight.w500),
            ),
            15.verticalSpace,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Direction:',
                    style: textStyle?.copyWith(
                        fontWeight: FontWeight.w400,
                        color: AppColors.textGray1)),
                Text('BUY EUR/USD',
                    style: textStyle?.copyWith(
                        fontWeight: FontWeight.w700,
                        color: AppColors.greenDark))
              ],
            ),
            10.verticalSpace,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Position Size:',
                  style: textStyle?.copyWith(
                      fontWeight: FontWeight.w400, color: AppColors.textGray1),
                ),
                Text(
                  '0.1 Lots',
                  style: textStyle,
                )
              ],
            ),
            10.verticalSpace,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Entry Price:',
                    style: textStyle?.copyWith(
                        fontWeight: FontWeight.w400,
                        color: AppColors.textGray1)),
                Text('1.0815 ',
                    style: textStyle?.copyWith(fontWeight: FontWeight.w500))
              ],
            ),
          ],
        ));
  }
}
