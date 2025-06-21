import '../../../../../core/export/export.core.dart';

class SettingsPasswordField extends StatefulWidget {
  const SettingsPasswordField(
      {super.key, this.onChange, required this.controller, this.label,this.hint});

  final TextEditingController controller;
  final void Function(String)? onChange;
  final String? label;
  final String? hint;

  @override
  State<SettingsPasswordField> createState() => _SettingsPasswordFieldState();
}

class _SettingsPasswordFieldState extends State<SettingsPasswordField> {
  bool obscureText = true;

  @override
  Widget build(BuildContext context) {
    return SettingsInputField(
      label: widget.label,
      minLine: 1,

      maxLine: 1,
      controller: widget.controller,

      obscureText: obscureText,
      suffix: IconButton(
          onPressed: () => setState(() {
                obscureText = !obscureText;
              }),
          icon: Icon(obscureText
              ? Icons.visibility_outlined
              : Icons.visibility_off_outlined)),
      enable: true,
      onChange: widget.onChange,
    );
  }
}

class SettingsInputField extends StatelessWidget {
  const SettingsInputField(
      {super.key,
      this.controller,
      this.enable = true,
      this.label,
      this.onChange,
        this.maxLine,
      this.obscureText = false,
      this.suffix,
        this.minLine,
        this.hint,
      this.initialValue});

  final String? initialValue;
  final int? minLine;
  final Widget? suffix;
  final String? hint;
  final int? maxLine;
  final bool obscureText;

  final TextEditingController? controller;

  final bool enable;
  final String? label;
  final void Function(String)? onChange;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (label != null) ...[
          Text(
            label!,
            style: context.textTheme.bodyMedium
                ?.copyWith(color: AppColors.textGray1),
          ),
          2.5.verticalSpace
        ],
        InputField.filled(
          fillColor: enable ? Color(0XFFFCFCFD) : Color(0xFFF2F4F7),
          initialValue: initialValue,
          onChange: onChange,
          hint: hint,
          surfixIcon: suffix,
          readOnly: !enable,
          obscureText: obscureText,
          minLines: minLine,
          maxLines: maxLine,
          controller: controller,
          useErrorBorder: false,
          useFocusBorder: false,
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: !enable
                  ? BorderSide.none
                  : const BorderSide(color: AppColors.gray)),
        )
      ],
    );
  }
}
