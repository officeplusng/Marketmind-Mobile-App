class InputValidators {
  static String? required(String? value) =>
      value?.trim().isEmpty == true ? 'Required' : null;
  static String? minLength(String? value,{int minLength =2}) =>
      (value?.trim().length??0) <2 ? 'Minimum Required Length is $minLength' : null;
  static String? emailValidator(String? value) {
    final email = value?.trim() ?? '';
    if (email.isEmpty) {
      return 'Email is required';
    }
    final emailRegex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
    if (!emailRegex.hasMatch(email)) {
      return 'Enter a valid email address';
    }
    return null;
  }
  static String? passwordValidation(String? input) => (input?.length ?? 0) < 6
      ? 'Password must be at least 6 characters'
      : null;

}
