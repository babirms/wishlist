class EmptyFieldValidator {
  static String? validateEmptyField(String? value) {
    if (value == null || value.isEmpty) {
      return 'Campo obrigatório';
    }
    return null;
  }
}
