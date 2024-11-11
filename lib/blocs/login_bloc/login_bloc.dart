import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../utils/auth_utils/form_submission_status.dart';
import '../../utils/auth_utils/validators.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc() : super(LoginState()) {
    on<EmailChanged>(_onEmailChanged);
    on<PasswordChanged>(_onPasswordChanged);
    on<SubmitLogin>(_onSubmitLogin);
  }

  void _onEmailChanged(EmailChanged event, Emitter<LoginState> emit) {
    emit(state.copyWith(
        email: event.email,
        isButtonEnabled: state.password.isNotEmpty && event.email.isNotEmpty));
  }

  void _onPasswordChanged(PasswordChanged event, Emitter<LoginState> emit) {
    emit(state.copyWith(
        password: event.password,
        isButtonEnabled: state.email.isNotEmpty && event.password.isNotEmpty));
  }

  Future<void> _onSubmitLogin(
      SubmitLogin event, Emitter<LoginState> emit) async {
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
