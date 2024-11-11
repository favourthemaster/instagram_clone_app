import 'package:flutter/material.dart';

import '../themes.dart';

class IGTextField extends StatefulWidget {
  final bool isPasswordField;
  final String hintText;
  final TextEditingController? controller;
  final Function(String value)? onChanged;

  const IGTextField({
    super.key,
    this.controller,
    required this.hintText,
    required this.isPasswordField,
    this.onChanged,
  });

  @override
  State<IGTextField> createState() => _IGTextFieldState();
}

class _IGTextFieldState extends State<IGTextField> {
  late FocusNode focusNode;
  bool isPasswordVisible = false;

  @override
  void initState() {
    super.initState();
    focusNode = FocusNode();
    focusNode.addListener(
      () => setState(() {}),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      child: TextField(
        onChanged: widget.onChanged,
        focusNode: focusNode,
        keyboardType: widget.isPasswordField
            ? TextInputType.visiblePassword
            : TextInputType.text,
        obscureText: widget.isPasswordField && !isPasswordVisible,
        style: TextStyle(
          fontSize: 15,
          color: Themes.isLightTheme(context) ? Colors.black : Colors.white,
        ),
        cursorColor:
            Themes.isLightTheme(context) ? Colors.black54 : Colors.white,
        controller: widget.controller,
        decoration: InputDecoration(
          suffixIcon: GestureDetector(
              onTap: widget.isPasswordField
                  ? () {
                      setState(() => isPasswordVisible = !isPasswordVisible);
                    }
                  : () {},
              child: widget.isPasswordField && focusNode.hasFocus
                  ? (isPasswordVisible
                      ? const Icon(
                          Icons.visibility_off_outlined,
                          color: Color(0xFFC8C8C8),
                        )
                      : const Icon(
                          Icons.visibility_outlined,
                          color: Color(0xFFC8C8C8),
                        ))
                  : const SizedBox()),
          hintText: widget.hintText,
        ),
      ),
    );
  }
}
