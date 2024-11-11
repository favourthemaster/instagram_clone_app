import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class ActionButtonWidget extends StatelessWidget {
  final void Function() onPressed;
  final double dimension;
  final String asset;
  final Color? color;
  const ActionButtonWidget(
      {super.key,
      required this.onPressed,
      required this.dimension,
      required this.asset,
      this.color});

  @override
  Widget build(BuildContext context) {
    return SizedBox.square(
      dimension: dimension,
      child: GestureDetector(
        onTap: () {
          onPressed();
        },
        child: SvgPicture.asset(
          asset,
          colorFilter: ColorFilter.mode(color ?? Colors.black, BlendMode.srcIn),
        ),
      ),
    );
  }
}

class NotificationButton extends StatelessWidget {
  final Function() onPressed;
  final double dimension;
  final String asset = "assets/svg_icons/Like.svg";
  const NotificationButton(
      {super.key, required this.onPressed, required this.dimension});

  @override
  Widget build(BuildContext context) {
    return ActionButtonWidget(
        onPressed: onPressed, dimension: dimension, asset: asset);
  }
}

class AddPostButton extends StatelessWidget {
  final Function() onPressed;
  final double dimension;
  final String asset = "assets/svg_icons/Add.svg";
  const AddPostButton(
      {super.key, required this.onPressed, required this.dimension});

  @override
  Widget build(BuildContext context) {
    return ActionButtonWidget(
        onPressed: onPressed, dimension: dimension, asset: asset);
  }
}

class CommentButton extends StatelessWidget {
  final Function() onPressed;
  final double dimension;
  final String asset = "assets/svg_icons/Comment.svg";
  const CommentButton({
    super.key,
    required this.onPressed,
    required this.dimension,
  });

  @override
  Widget build(BuildContext context) {
    return ActionButtonWidget(
        onPressed: onPressed, dimension: dimension, asset: asset);
  }
}

class ShareButton extends StatelessWidget {
  final Function() onPressed;
  final double dimension;
  final String asset = "assets/svg_icons/Share.svg";
  const ShareButton({
    super.key,
    required this.onPressed,
    required this.dimension,
  });

  @override
  Widget build(BuildContext context) {
    return ActionButtonWidget(
        onPressed: onPressed, dimension: dimension, asset: asset);
  }
}

class SaveButton extends StatelessWidget {
  final Function() onPressed;
  final double dimension;
  final String asset = "assets/svg_icons/Bookmark.svg";
  const SaveButton(
      {super.key, required this.onPressed, required this.dimension});

  @override
  Widget build(BuildContext context) {
    return ActionButtonWidget(
        onPressed: onPressed, dimension: dimension, asset: asset);
  }
}

class ChatButton extends StatelessWidget {
  final Function() onPressed;
  final double dimension;
  final String asset = "assets/svg_icons/Messenger.svg";
  const ChatButton(
      {super.key, required this.onPressed, required this.dimension});

  @override
  Widget build(BuildContext context) {
    return ActionButtonWidget(
        onPressed: onPressed, dimension: dimension, asset: asset);
  }
}

class ReelsButton extends StatelessWidget {
  final Function() onPressed;
  final double dimension;
  final String asset = "assets/svg_icons/Reels.svg";
  const ReelsButton(
      {super.key, required this.onPressed, required this.dimension});

  @override
  Widget build(BuildContext context) {
    return ActionButtonWidget(
        onPressed: onPressed, dimension: dimension, asset: asset);
  }
}

class MoreButton extends StatelessWidget {
  final Function() onPressed;
  final double dimension;
  final String asset = "assets/svg_icons/More.svg";
  final Color? color;
  const MoreButton(
      {super.key,
      required this.onPressed,
      required this.dimension,
      this.color});

  @override
  Widget build(BuildContext context) {
    return Transform.rotate(
      origin: Offset.zero,
      angle: 3.14 / 2,
      child: ActionButtonWidget(
          onPressed: onPressed,
          dimension: dimension,
          asset: asset,
          color: color),
    );
  }
}

class SearchButton extends StatelessWidget {
  final Function() onPressed;
  final double dimension;
  final String asset = "assets/svg_icons/Search.svg";
  const SearchButton(
      {super.key, required this.onPressed, required this.dimension});

  @override
  Widget build(BuildContext context) {
    return ActionButtonWidget(
        onPressed: onPressed, dimension: dimension, asset: asset);
  }
}

class HomeButton extends StatelessWidget {
  final Function() onPressed;
  final double dimension;
  final String asset = "assets/svg_icons/Home.svg";
  const HomeButton(
      {super.key, required this.onPressed, required this.dimension});

  @override
  Widget build(BuildContext context) {
    return ActionButtonWidget(
        onPressed: onPressed, dimension: dimension, asset: asset);
  }
}
