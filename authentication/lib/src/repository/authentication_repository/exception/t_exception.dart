class TException implements Exception {
  final String message;

  TException([
    this.message = 'An Unknown Exception Occured',
  ]);

  //to pass e.code for specific firebaseAuthException we have to create fatory constructor
  factory TException.code(String code) {
    switch (code) {
      case 'weak_password':
        return TException('Please enter a stronger password.');
      case 'invalid_email':
        return TException('Email is not valid or badly formatted.');
      case 'email_already_in_use':
        return TException('An account already exists for that email.');
      case 'operation_not_allowed':
        return TException('Operation is not allowed.Please contact support.');
      case 'user_disabled':
        return TException(
            'This user is disabled.Please contact support for help.');
      default:
        return TException();
    }
  }
}
