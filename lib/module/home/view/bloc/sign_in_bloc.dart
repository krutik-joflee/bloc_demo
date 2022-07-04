import 'package:bloc/bloc.dart';
import 'package:bloc_demo/module/home/view/bloc/sign_in_event.dart';
import 'package:bloc_demo/module/home/view/bloc/sign_in_state.dart';
import 'package:email_validator/email_validator.dart';

class SignInBloc extends Bloc<SignInEvent, SignInState> {
  SignInBloc(super.initialState) {
    on<SignInTextChangedEvent>((event, emit) {
      if (EmailValidator.validate(event.emailvalue) == false) {
        emit(SignInErrorState("please enter valid emailaddress"));
      } else if (event.passwordvalue.length <= 8) {
        emit(SignInErrorState("please enter valid password"));
      } else {
        emit(SignInValidState());
      }
    });
    on<SignInSubmittedevent>((event, emit) {
      emit(SignInLodingState());
    });
  }
}
