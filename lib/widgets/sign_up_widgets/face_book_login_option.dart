import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class FaceBookLoginOption extends StatelessWidget {
  final Function() onPressed;
  const FaceBookLoginOption({super.key, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SvgPicture.asset(
            "assets/svgs/facebook_logo.svg",
            height: 20,
          ),
          const SizedBox(
            width: 10,
          ),
          const Text(
            "Log in with Facebook",
            style: TextStyle(
                fontSize: 15,
                color: Color(0xFF3797EF),
                fontWeight: FontWeight.bold),
          )
        ],
      ),
    );
  }
}
