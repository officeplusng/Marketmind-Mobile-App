import '../../../../../core/export/export.core.dart';

class AppSwitch extends StatefulWidget {
  const AppSwitch({super.key,this.onChanged,this.initialValue=false});
  final bool initialValue;

  final void Function(bool)?onChanged;
  @override
  State<AppSwitch> createState() => _AppSwitchState();
}

class _AppSwitchState extends State<AppSwitch> {
  bool toggle=false;
  @override
  void initState() {
    toggle=widget.initialValue;
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Switch(
        value: toggle,
        activeColor: AppColors.primary,
        activeTrackColor: AppColors.primary,
        inactiveTrackColor: const Color(0XFFEAECF0),
        thumbColor: WidgetStateProperty.resolveWith((state) {
          if (state.contains(WidgetState.selected)  ) {
            return AppColors.white;
          } else {
            return AppColors.primary;
          }
        }),
        onChanged: (value) => setState(() {
          toggle = value;
          widget.onChanged?.call(value);
        }));
  }
}
