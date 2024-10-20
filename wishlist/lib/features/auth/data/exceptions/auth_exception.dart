class AuthException implements Exception {
  final String message;

  AuthException(this.message);
}

class EmailAlreadyInUseException extends AuthException {
  EmailAlreadyInUseException() : super('Esse email já está em uso. ');
}

class PasswordResetFailedException extends AuthException {
  PasswordResetFailedException()
      : super('Falha ao enviar email de redefinição de senha.');
}

class InvalidCredentialException extends AuthException {
  InvalidCredentialException() : super('Email e/ou senha inválidos.');
}
