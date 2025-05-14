
import 'package:marketmind/core/export/export.core.dart';
import 'package:flutter/material.dart';
import 'package:otp_pin_field/otp_pin_field.dart';

class OtpInputField extends StatelessWidget {
  const OtpInputField({super.key, this.length = 4,required this.onChange});

  final void Function(String) onChange;
  final int length;

  @override
  Widget build(BuildContext context) {
    return OtpPinField(
      onSubmit: (value) {},
      onChange: onChange,
    );
  }
}
