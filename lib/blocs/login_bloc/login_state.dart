part of "login_bloc.dart";

class LoginState extends Equatable {
  final bool isButtonEnabled;
  final String email;
  final String password;
  final String errorMessage;
  final bool isValidated;
  final FormSubmissionStatus status;
  LoginState({
    this.isButtonEnabled = false,
    this.email = '',
    this.password = '',
    this.errorMessage = '',
    this.isValidated = false,
    this.status = FormSubmissionStatus.initial,
  });

  LoginState copyWith({
    final bool? isButtonEnabled,
    final String? email,
    final String? password,
    final String? errorMessage,
    final bool? isValidated,
    final FormSubmissionStatus? status,
  }) {
    return LoginState(
      isButtonEnabled: isButtonEnabled ?? this.isButtonEnabled,
      email: email ?? this.email,
      password: password ?? this.password,
      errorMessage: errorMessage ?? this.errorMessage,
      isValidated: isValidated ?? this.isValidated,
      status: status ?? this.status,
    );
  }

  @override
  List<Object?> get props =>
      [isButtonEnabled, email, password, errorMessage, isValidated, status];
}
