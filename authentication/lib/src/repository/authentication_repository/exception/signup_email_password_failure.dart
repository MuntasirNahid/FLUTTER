class signUpEmailPasswordFailure {
  final String message;

  signUpEmailPasswordFailure([
    this.message = 'An Unknown Error Occured',
  ]);

  //to pass e.code for specific firebaseAuthException we have to create fatory constructor
  factory signUpEmailPasswordFailure.code(String code) {
    switch (code) {
      case 'weak_password':
        return signUpEmailPasswordFailure('Please enter a stronger password.');
      case 'invalid_email':
        return signUpEmailPasswordFailure(
            'Email is not valid or badly formatted.');
      case 'email_already_in_use':
        return signUpEmailPasswordFailure(
            'An account already exists for that email.');
      case 'operation_not_allowed':
        return signUpEmailPasswordFailure(
            'Operation is not allowed.Please contact support.');
      case 'user_disabled':
        return signUpEmailPasswordFailure(
            'This user is disabled.Please contact support for help.');
      default:
        return signUpEmailPasswordFailure();
    }
  }
}
