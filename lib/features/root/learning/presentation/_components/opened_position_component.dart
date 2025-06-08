import 'package:marketmind/core/export/export.core.dart';

class OpenedPosition extends StatelessWidget {
  const OpenedPosition({super.key});

  @override
  Widget build(BuildContext context) {
    final data = [
      (true, 'EURUSD', '2.90'),
      (false, 'JPYCAD', '320'),
    ];
    return ListView.separated(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: data.length,
      separatorBuilder: (_,index)=>10.verticalSpace,
      itemBuilder: (context,index){
        final e = data[index];
        return OpenedPositionComponent(
          pair: e.$2,
          amount: e.$3,
          buy: e.$1,
        );
      },
    );
  }
}

class OpenedPositionComponent extends StatelessWidget {
  const OpenedPositionComponent(
      {super.key, this.buy = false, required this.pair, required this.amount});

  final bool buy;
  final String pair;
  final String amount;

  @override
  Widget build(BuildContext context) {
    return WrapperContainer.rectangular(
        useHeight: false,
        useWidth: false,
        backgroundColor: AppColors.white,
        borderColor: AppColors.gray4,
        bordered: true,
        borderRadius: 8,
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Row(
              children: [
                _tradeAction(buy: buy),
                10.horizontalSpace,
                Text(
                  pair,
                  style: context.textTheme.bodyMedium
                      ?.copyWith(fontWeight: FontWeight.w500),
                ),
                const Spacer(),
                Text(
                  '+\$$amount',
                  style: context.textTheme.bodyMedium?.copyWith(
                      fontWeight: FontWeight.w500, color: AppColors.greenDark),
                )
              ],
            ),
            10.verticalSpace,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _textSpanData(title: 'Entry', value: '1.0815'),
                _textSpanData(title: 'Lot Size', value: '1'),
                SizedBox()
              ],
            ),
            5.verticalSpace,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _textSpanData(title: 'Current', value: '1.0822'),
                _textSpanData(title: 'Open', value: '10:32AM'),
                SizedBox()
              ],
            ),
          ],
        ));
  }

  Widget _textSpanData({required String title, required String value}) {
    return Builder(builder: (context) {
      final style =
          context.textTheme.bodySmall?.copyWith(color: const Color(0XFF475467));
      return Text.rich(TextSpan(
          text: '$title:\t',
          style: style,
          children: [TextSpan(text: value, style: style)]));
    });
  }

  Widget _tradeAction({
    bool buy = true,
  }) {
    return Builder(builder: (context) {
      return Container(
        height: 21,
        alignment: Alignment.center,
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
        decoration: ShapeDecoration(
            color: buy ? AppColors.greenLight1 : AppColors.redLight,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16))),
        child: Center(
          child: Text(
            buy ? 'BUY' : 'SELL',
            style: context.textTheme.bodyMedium?.copyWith(
                fontWeight: FontWeight.w500,
                color: buy ? AppColors.textGreen : AppColors.red),
          ),
        ),
      );
    });
  }
}
