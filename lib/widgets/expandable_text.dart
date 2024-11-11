import 'package:flutter/material.dart';

class ExpandableText extends StatefulWidget {
  final String text;
  final int maxLines;
  final TextStyle style;

  const ExpandableText({
    Key? key,
    required this.text,
    this.maxLines = 2,
    this.style = const TextStyle(),
  }) : super(key: key);

  @override
  _ExpandableTextState createState() => _ExpandableTextState();
}

class _ExpandableTextState extends State<ExpandableText> {
  bool _isExpanded = false;
  String firstHalf = '';
  String userName = '';
  String secondHalf = '';

  @override
  void initState() {
    super.initState();
    userName = widget.text.substring(0, widget.text.indexOf(" "));
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final span = TextSpan(text: widget.text, style: widget.style);
      final tp = TextPainter(
        text: span,
        maxLines: widget.maxLines,
        textDirection: TextDirection.ltr,
      );
      tp.layout(maxWidth: MediaQuery.of(context).size.width);

      if (tp.didExceedMaxLines) {
        final endIndex =
            tp.getPositionForOffset(Offset(tp.width - 150, tp.height)).offset;
        setState(() {
          final firstPart = widget.text.substring(0, endIndex);
          final newLineIndex = firstPart.indexOf('\n');
          if (newLineIndex != -1 && newLineIndex < endIndex) {
            firstHalf =
                widget.text.substring(userName.length, newLineIndex).trim();
            secondHalf = widget.text.substring(newLineIndex).trim();
          } else {
            firstHalf = firstPart.substring(userName.length);
            secondHalf = widget.text.substring(endIndex).trim();
          }
        });
      } else {
        setState(() {
          firstHalf = widget.text.substring(userName.length);
          secondHalf = '';
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        GestureDetector(
          onTap: () => !_isExpanded
              ? setState(() => _isExpanded = !_isExpanded)
              : print("Go to comments with this as the first thing there"),
          child: RichText(
            text: TextSpan(
              text: "$userName ",
              style: widget.style.copyWith(fontWeight: FontWeight.bold),
              children: [
                TextSpan(
                  text: _isExpanded
                      ? widget.text.substring(userName.length)
                      : firstHalf,
                  style: widget.style.copyWith(fontWeight: FontWeight.normal),
                ),
                if (!_isExpanded && secondHalf.isNotEmpty)
                  TextSpan(
                    text: '...more',
                    style: widget.style.copyWith(
                        color: Color(0xFF737373),
                        fontWeight: FontWeight.normal),
                  ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
