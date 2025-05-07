class InputValidators {
  static String? required(String? value) =>
      value?.trim().isEmpty == true ? 'Required' : null;
  static String? emailValidator(String? value) =>
      value?.trim().isEmpty == true ? 'Required' : null;
}
