import 'package:flutter/material.dart';

import 'action_button_widgets.dart';

class LikeButton extends StatefulWidget {
  final Function() onPressed;
  bool isLiked;
  final double dimension;
  LikeButton(
      {super.key,
      required this.onPressed,
      required this.dimension,
      this.isLiked = false});
  final String asset1 = "assets/svgs/like_svg.svg";
  final String asset2 = "assets/svgs/like_filled_svg.svg";
  @override
  State<LikeButton> createState() => _LikeButtonState();
}

class _LikeButtonState extends State<LikeButton>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  void like() {
    _controller.reset();
    _controller.forward();
    setState(() {
      widget.isLiked = !widget.isLiked;
    });
  }

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
        duration: const Duration(milliseconds: 1200), vsync: this)
      ..addListener(() {
        if (_controller.isCompleted) {
          _controller.reset();
          // _controller.reverse();
        }
      });
    _animation = Tween(begin: 0.0, end: 1.0).animate(
        CurvedAnimation(parent: _controller, curve: Curves.elasticOut));
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox.square(
      dimension: widget.dimension + 5,
      child: Center(
        child: AnimatedBuilder(
          animation: _animation,
          builder: (context, _) => ActionButtonWidget(
            onPressed: () {
              like();
              widget.onPressed();
            },
            dimension: _controller.isAnimating
                ? widget.dimension * _animation.value
                : widget.dimension,
            asset: widget.isLiked ? widget.asset2 : widget.asset1,
            color: widget.isLiked ? Colors.red : null,
          ),
        ),
      ),
    );
  }
}
