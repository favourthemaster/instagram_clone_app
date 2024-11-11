import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:instagram_clone_app/blocs/signup_bloc/signup_bloc.dart';
import 'package:instagram_clone_app/screens/home_screen.dart';
import 'package:instagram_clone_app/screens/log_in_screen.dart';
import 'package:instagram_clone_app/utils/auth_utils/form_submission_status.dart';
import 'package:instagram_clone_app/widgets/instagram_name.dart';

import '../widgets/buttons/ig_button.dart';
import '../widgets/ig_textField.dart';
import '../widgets/or_divider.dart';
import '../widgets/sign_up_widgets/face_book_login_option.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => SignupBloc(),
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: SafeArea(
          child: Center(
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 380),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 60,
                    child: InstagramName(),
                  ),
                  const SizedBox(
                    height: 60,
                  ),
                  BlocBuilder<SignupBloc, SignupState>(
                    builder: (context, state) => Column(
                      children: [
                        IGTextField(
                          onChanged: (email) => context
                              .read<SignupBloc>()
                              .add(EmailChanged(email)),
                          hintText: "Email, Username or Phone Number",
                          isPasswordField: false,
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        IGTextField(
                          onChanged: (password) => context
                              .read<SignupBloc>()
                              .add(PasswordChanged(password)),
                          hintText: "Password",
                          isPasswordField: true,
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 50,
                  ),

                  BlocConsumer<SignupBloc, SignupState>(
                    listener: (context, state) {
                      if (state.status == FormSubmissionStatus.success) {
                        Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => HomeScreen(),
                        ));
                      }
                    },
                    builder: (context, state) => Column(
                      children: [
                        Text(
                          state.errorMessage,
                          style: TextStyle(
                            color: Colors.red,
                          ),
                        ),
                        IGButton(
                          label: "Sign Up",
                          onPressed: state.isButtonEnabled &&
                                  state.status == FormSubmissionStatus.initial
                              ? () {
                                  context.read<SignupBloc>().add(SubmitLogin());
                                }
                              : null,
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  //Log in with facebook option
                  FaceBookLoginOption(onPressed: () {}),
                  const SizedBox(
                    height: 40,
                  ),
                  //OR divider
                  const OrDivider(),
                  const SizedBox(
                    height: 40,
                  ),
                  //Already have an account section
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        "Already have an account?",
                        style: TextStyle(
                          color: Color(0xFFCCCCCC),
                          fontSize: 15,
                        ),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      //Log In option
                      GestureDetector(
                        onTap: () {
                          //Go to loginScreen
                          Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                builder: (context) => LogInScreen(),
                              ));
                        },
                        child: const Text(
                          "Log In.",
                          style: TextStyle(
                            color: Color(0xFF3797EF),
                            fontSize: 15,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
