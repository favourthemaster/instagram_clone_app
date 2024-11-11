import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:instagram_clone_app/screens/sign_up_screen.dart';

import '../blocs/login_bloc/login_bloc.dart';
import '../utils/auth_utils/form_submission_status.dart';
import '../widgets/buttons/ig_button.dart';
import '../widgets/ig_textField.dart';
import '../widgets/or_divider.dart';
import '../widgets/sign_up_widgets/face_book_login_option.dart';
import 'home_screen.dart';

class LogInScreen extends StatelessWidget {
  const LogInScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => LoginBloc(),
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
                    child: SvgPicture.asset("assets/svgs/ig_name.svg"),
                  ),
                  const SizedBox(
                    height: 60,
                  ),
                  BlocBuilder<LoginBloc, LoginState>(
                    builder: (context, state) => IGTextField(
                      hintText: "Email, Username or Phone Number",
                      isPasswordField: false,
                      onChanged: (email) =>
                          context.read<LoginBloc>().add(EmailChanged(email)),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  BlocBuilder<LoginBloc, LoginState>(
                    builder: (context, state) => IGTextField(
                      hintText: "Password",
                      isPasswordField: true,
                      onChanged: (password) => context
                          .read<LoginBloc>()
                          .add(PasswordChanged(password)),
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Align(
                    alignment: Alignment.centerRight,
                    child: GestureDetector(
                      onTap: () {},
                      child: const Text(
                        "Forgot password?",
                        style: TextStyle(
                          color: Color(0xFF3797EF),
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  BlocConsumer<LoginBloc, LoginState>(
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
                          label: "Log In",
                          onPressed: state.isButtonEnabled &&
                                  state.status == FormSubmissionStatus.initial
                              ? () {
                                  context.read<LoginBloc>().add(SubmitLogin());
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
                        "Don't have an account?",
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
                          //Navigate to Sign Up Screen
                          Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                builder: (context) => SignUpScreen(),
                              ));
                        },
                        child: const Text(
                          "Sign Up.",
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
