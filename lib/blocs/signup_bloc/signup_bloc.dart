import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:instagram_clone_app/utils/auth_utils/form_submission_status.dart';

import '../../utils/auth_utils/validators.dart';

part 'signup_event.dart';
part 'signup_state.dart';

class SignupBloc extends Bloc<SignupEvent, SignupState> {
  SignupBloc() : super(SignupState()) {
    on<EmailChanged>(_onEmailChanged);
    on<PasswordChanged>(_onPasswordChanged);
    on<SubmitLogin>(_onSubmitLogin);
  }

  void _onEmailChanged(EmailChanged event, Emitter<SignupState> emit) {
    emit(state.copyWith(
        email: event.email,
        status: FormSubmissionStatus.initial,
        isButtonEnabled: state.password.isNotEmpty && event.email.isNotEmpty));
  }

  void _onPasswordChanged(PasswordChanged event, Emitter<SignupState> emit) {
    emit(state.copyWith(
        password: event.password,
        status: FormSubmissionStatus.initial,
        isButtonEnabled: state.email.isNotEmpty && event.password.isNotEmpty));
  }

  Future<void> _onSubmitLogin(
      SubmitLogin event, Emitter<SignupState> emit) async {
    final isValidEmail = Validators.emailRegex.hasMatch(state.email);
    final isValidPassword = Validators.passwordRegex.hasMatch(state.password);
    final isValidated = isValidEmail && isValidPassword;
    final errorMessage = isValidEmail
        ? (isValidPassword ? '' : 'Password must be at least 8 characters')
        : 'Please enter a valid email';

    emit(state.copyWith(errorMessage: errorMessage, isValidated: isValidated));
    if (isValidated) {
      emit(state.copyWith(status: FormSubmissionStatus.inProgress));
      await Future.delayed(const Duration(seconds: 3));
      emit(state.copyWith(status: FormSubmissionStatus.success));
    }
  }
}
