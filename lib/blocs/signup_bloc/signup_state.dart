part of "signup_bloc.dart";

class SignupState extends Equatable {
  final bool isButtonEnabled;
  final String email;
  final String password;
  final String errorMessage;
  final bool isValidated;
  final FormSubmissionStatus status;
  SignupState({
    this.isButtonEnabled = false,
    this.email = '',
    this.password = '',
    this.errorMessage = '',
    this.isValidated = false,
    this.status = FormSubmissionStatus.initial,
  });

  SignupState copyWith({
    final bool? isButtonEnabled,
    final String? email,
    final String? password,
    final String? errorMessage,
    final bool? isValidated,
    final FormSubmissionStatus? status,
  }) {
    return SignupState(
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
