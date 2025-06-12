import 'package:marketmind/core/export/export.core.dart';
import 'package:marketmind/features/root/component/custom_app_bar.dart';
import 'package:marketmind/features/root/home/presentation/components/home_app_bar_action_icon.dart';
import 'package:marketmind/features/root/learning/presentation/_components/tp_sl_configuration.dart';
import 'package:marketmind/features/root/learning/presentation/modals/confirm_trade_modal.dart';

import '../../_components/input_field2.dart';

class TradeExecutionScreen extends StatefulWidget {
  const TradeExecutionScreen({super.key});

  @override
  State<TradeExecutionScreen> createState() => _TradeExecutionScreenState();
}

class _TradeExecutionScreenState extends State<TradeExecutionScreen> {
  final TextEditingController _lotSizeController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var copyWith =
        context.textTheme.bodyMedium?.copyWith(color: AppColors.textGray1);
    var boldStyle = copyWith?.copyWith(
        fontSize: 20, fontWeight: FontWeight.bold, color: AppColors.textBlack);
    return BaseScaffold(
        child: SafeArea(
            child: Column(
      children: [
        20.verticalSpace,
        CustomAppBar(
          backIcon: Icons.close,
          action: [
            HomeAppBarActionIcon(
              onClick: () {},
              color: AppColors.lightBlue,
              child: const Icon(
                Icons.read_more,
                color: AppColors.primaryDark,
                size: 18,
              ),
            ),
          ],
        ),
     10.verticalSpace,
     Expanded(child: SingleChildScrollView(
       child: Column(
         children: [
           10.verticalSpace,
           Row(
             mainAxisAlignment: MainAxisAlignment.spaceBetween,
             children: [
               Text(
                 'EUR/USD',
                 style: context.textTheme.titleMedium?.copyWith(fontSize: 28),
               )
             ],
           ),
           20.verticalSpace,
           Row(
             mainAxisAlignment: MainAxisAlignment.spaceBetween,
             children: [
               Text(
                 'Virtual Balance',
                 style: copyWith,
               ),
               Text('Current Price', style: copyWith),
             ],
           ),
           10.verticalSpace,
           Row(
             mainAxisAlignment: MainAxisAlignment.spaceBetween,
             children: [
               Text(
                 '\$10,000.00',
                 style: boldStyle,
               ),
               Text(
                 '1.0815',
                 style: boldStyle,
               ),
             ],
           ),
           10.verticalSpace,
           Row(
             mainAxisAlignment: MainAxisAlignment.spaceBetween,
             children: [
               Text(
                 'Support: 10796',
                 style: copyWith?.copyWith(
                     color: AppColors.greenDark, fontWeight: FontWeight.w500),
               ),
               Text('Resistance: 1.085',
                   style: copyWith?.copyWith(
                       color: AppColors.red, fontWeight: FontWeight.w500)),
             ],
           ),
           10.verticalSpace,
           const Divider(),
           10.verticalSpace,
           _container(
               child: Column(
                 children: [
                   Row(
                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                     crossAxisAlignment: CrossAxisAlignment.center,
                     children: [
                       Text(
                         'Position Size',
                         style: context.textTheme.titleSmall
                             ?.copyWith(color: AppColors.textGray1),
                       ),
                       const Icon(
                         Icons.info_outline,
                         color: AppColors.primaryDark,
                       )
                     ],
                   ),
                   10.verticalSpace,
                   InputField2(controller: _lotSizeController, hint: 'Lot size')
                 ],
               )),
           20.verticalSpace,
           TpSlConfiguration(
               controller: _lotSizeController,
               descriptionTrailing: 'stop loss',
               riskAmount: '\$36.00',
               profit: '\$36.00',
               price: '1.952',
               pips: '35 pips',
               title: 'Stop loss(pips)'),
           20.verticalSpace,
           TpSlConfiguration(
               controller: _lotSizeController,
               descriptionTrailing: 'take profit',
               sliderColor: AppColors.primary,
               riskAmount: '\$36.00',
               profit: '\$36.00',
               price: '1.952',
               pips: '35 pips',
               title: 'Take Profit(pips)'),
           50.verticalSpace,
           Row(
             children: [
               Expanded(child: PrimaryButton.outlined(text: 'Cancel',)),
               20.horizontalSpace,
               Expanded(child: PrimaryButton.primary(text: 'Execute Trade',color: AppColors.buttonGreen,onPressed: (){
                 ModalHelper.showModalMax(context, ConfirmTradeModal());
               },))
             ],
           ),
           100.verticalSpace,
         ],
       ),
     ))
      ],
    )));
  }

  Widget _container({required Widget child,Color? color,double? padding}) {
    return WrapperContainer.rectangular(
        bordered: true,
        useHeight: false,
        useWidth: false,
        backgroundColor:color?? const Color(0XFFFCFCFD),
        borderColor: const Color(0XFFF2F4F7),
        padding:  EdgeInsets.all(padding??8),
        borderRadius: 8,
        child: child);
  }
}
