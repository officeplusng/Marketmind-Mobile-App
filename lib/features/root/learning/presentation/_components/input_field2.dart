import 'package:marketmind/core/export/export.core.dart';

class InputField2 extends StatelessWidget {
  const InputField2({super.key,required this.controller,this.hint,this.inputType,this.onChange});

  final TextEditingController controller;
  final String? hint;
  final TextInputType? inputType;
  final void Function(String)? onChange;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      onChanged: onChange,
      keyboardType: inputType,
      decoration: InputDecoration(
          filled: true,

          fillColor: AppColors.white,
          hintText: hint,
          contentPadding:
          const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
          constraints: const BoxConstraints(minHeight: 36),
          hintStyle: context.textTheme.bodyMedium?.copyWith(
            color: Colors.grey,
          ),
          errorStyle: context.textTheme.bodySmall?.copyWith(color: Colors.red),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: const BorderSide(
              color: Color(0XFFEAECF0),
            ),
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: const BorderSide(
              color: Color(0XFFEAECF0),
            ),
          ),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: const BorderSide(
                color: Color(0XFFEAECF0),
              ))),
    );
  }


}
