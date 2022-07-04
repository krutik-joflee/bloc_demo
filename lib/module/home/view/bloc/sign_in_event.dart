abstract class SignInEvent {}

class SignInTextChangedEvent extends SignInEvent {
  final String emailvalue;
  final String passwordvalue;

  SignInTextChangedEvent(this.emailvalue, this.passwordvalue);
}

class SignInSubmittedevent extends SignInEvent {
  final String email;
  final String password;

  SignInSubmittedevent(this.email, this.password);
}
