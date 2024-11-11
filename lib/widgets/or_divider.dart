import 'package:flutter/material.dart';

class OrDivider extends StatelessWidget {
  const OrDivider({super.key});

  @override
  Widget build(BuildContext context) {
    return const Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Expanded(
          child: SizedBox(
            height: 1,
            child: ColoredBox(
              color: Color(0xFFCCCCCC),
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 30.0),
          child: Text(
            'OR',
            style: TextStyle(
              color: Color(0xFFCCCCCC),
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        Expanded(
          child: SizedBox(
            height: 1,
            child: ColoredBox(
              color: Color(0xFFCCCCCC),
            ),
          ),
        ),
      ],
    );
  }
}
