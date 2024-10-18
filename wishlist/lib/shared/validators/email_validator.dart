import 'package:wishlist/shared/validators/empty_field_validator.dart';

class EmailValidator {
  static String? validateEmail(String? value) {
    final isEmpty = EmptyFieldValidator.validateEmptyField(value);

    if (isEmpty != null) {
      return isEmpty;
    }

    final RegExp emailRegex =
        RegExp(r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$');

    if (!emailRegex.hasMatch(value!)) {
      return 'Digite um email válido';
    }
    return null;
  }
}
