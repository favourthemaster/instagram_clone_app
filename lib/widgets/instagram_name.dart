import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../themes.dart';

class InstagramName extends StatelessWidget {
  const InstagramName({super.key});

  @override
  Widget build(BuildContext context) {
    return Themes.isLightTheme(context)
        ? SvgPicture.asset(
            "assets/svgs/ig_name.svg",
          )
        : SvgPicture.asset(
            "assets/svgs/ig_name.svg",
            colorFilter: ColorFilter.mode(Colors.white, BlendMode.srcIn),
          );
  }
}
