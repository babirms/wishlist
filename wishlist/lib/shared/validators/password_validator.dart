import 'package:wishlist/shared/validators/empty_field_validator.dart';

class PasswordValidator {
  static String? validatePassword(String? value) {
    final isEmpty = EmptyFieldValidator.validateEmptyField(value);

    if (isEmpty != null) {
      return isEmpty;
    }

    if (value!.length < 8) {
      return 'A senha deve ter pelo menos 8 caracteres';
    }

    if (!RegExp(r'\d').hasMatch(value)) {
      return 'A senha deve conter pelo menos um número';
    }

    if (!RegExp(r'[!@#$%^&*(),.?":{}|<>]').hasMatch(value)) {
      return 'A senha deve conter pelo menos um caractere especial';
    }
    return null;
  }

  static String? validateConfirmPassword(
      String? value, String? confirmPassword) {
    final isEmpty = EmptyFieldValidator.validateEmptyField(confirmPassword);

    if (isEmpty != null) {
      return isEmpty;
    }

    if (value != confirmPassword) {
      return 'As senhas não conferem';
    }
    return null;
  }
}
