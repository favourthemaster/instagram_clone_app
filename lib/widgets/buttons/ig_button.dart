import 'package:flutter/material.dart';

class IGButton extends StatefulWidget {
  final String label;
  final Function()? onPressed;
  const IGButton({
    super.key,
    required this.label,
    required this.onPressed,
  });

  @override
  State<IGButton> createState() => _IGButtonState();
}

class _IGButtonState extends State<IGButton> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      width: double.infinity,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(5),
        child: MaterialButton(
          disabledColor: const Color(0xFF9BCCF7),
          color: const Color(0xFF3797EE),
          onPressed: widget.onPressed,
          child: Text(
            widget.label,
            style: const TextStyle(
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
