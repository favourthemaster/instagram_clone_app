import 'dart:math';

import 'package:flutter/material.dart';

import 'customPaints.dart';

class ProfilePicture extends StatelessWidget {
  const ProfilePicture({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      final size = constraints.maxWidth < 80 ? constraints.maxWidth : 80.0;
      return SizedBox.square(
        dimension: size,
        child: CircleAvatar(),
      );
    });
  }
}

class StoryUnviewedProfilePicture extends StatelessWidget {
  const StoryUnviewedProfilePicture({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      final size = constraints.maxWidth < 80 ? constraints.maxWidth : 80.0;
      return SizedBox.square(
          dimension: size,
          child: CustomPaint(
            painter: StoryUnviewedProfilePicturePainter(),
            size: Size.square(size / 2),
            child: Padding(
              padding: EdgeInsets.all(pow(size, 1 / 4).toDouble() * 1.5),
              child: CircleAvatar(),
            ),
          ));
    });
  }
}

class StoryViewedProfilePicture extends StatelessWidget {
  const StoryViewedProfilePicture({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      final size = constraints.maxWidth < 80 ? constraints.maxWidth : 80.0;
      return SizedBox.square(
          dimension: size,
          child: CustomPaint(
            painter: StoryViewedProfilePicturePainter(),
            size: Size.square(size / 2),
            child: Padding(
              padding: EdgeInsets.all(pow(size, 1 / 4).toDouble() * 1.5),
              child: CircleAvatar(),
            ),
          ));
    });
  }
}

class LiveProfilePicture extends StatelessWidget {
  const LiveProfilePicture({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final size = constraints.maxWidth < 80 ? constraints.maxWidth : 80.0;
        return SizedBox(
          height: size,
          width: size,
          child: Stack(
            fit: StackFit.expand,
            alignment: Alignment.center,
            children: [
              const DecoratedBox(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      Color(0xFFE20337),
                      Color(0xFFC60188),
                      Color(0xFF7700C3),
                    ],
                    stops: [0, 0.52, 1],
                    begin: Alignment.bottomRight,
                    end: Alignment.topLeft,
                  ),
                  shape: BoxShape.circle,
                ),
                child: Padding(
                  padding: EdgeInsets.all(2.5),
                  child: DecoratedBox(
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.white,
                    ),
                    child: Padding(
                      padding: EdgeInsets.all(2.0),
                      child: CircleAvatar(),
                    ),
                  ),
                ),
              ),
              size > 20
                  ? Positioned(
                      bottom: 0,
                      left: size * 0.25,
                      right: size * 0.25,
                      child: DecoratedBox(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(size / 16),
                          color: Colors.white,
                        ),
                        child: Padding(
                            padding: EdgeInsets.all(size / 40),
                            child: DecoratedBox(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(size / 17),
                                gradient: const LinearGradient(
                                  colors: [
                                    Color(0xFFC90083),
                                    Color(0xFFD22463),
                                    Color(0xFFE10038),
                                  ],
                                  begin: Alignment.topLeft,
                                  end: Alignment.bottomRight,
                                  stops: [0, 0.22, 1],
                                ),
                              ),
                              child: Center(
                                child: Text(
                                  "LIVE",
                                  softWrap: true,
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                    fontSize: size > 40 ? size / 6 : size / 5.5,
                                  ),
                                ),
                              ),
                            )),
                      ),
                    )
                  : const SizedBox(),
            ],
          ),
        );
      },
    );
  }
}

class AddStoryProfilePicture extends StatelessWidget {
  const AddStoryProfilePicture({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final size = constraints.maxWidth < 80 ? constraints.maxWidth : 80.0;
        return SizedBox(
          height: size,
          width: size,
          child: Stack(
            fit: StackFit.expand,
            alignment: Alignment.center,
            children: [
              const CircleAvatar(),
              Positioned(
                bottom: 0,
                right: 0,
                child: ConstrainedBox(
                  constraints: BoxConstraints(
                      maxHeight: size * 0.4,
                      maxWidth: size * 0.4,
                      minWidth: 0,
                      minHeight: 0),
                  child: DecoratedBox(
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.white,
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(2.0),
                      child: DecoratedBox(
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: Color(0xFF3897F0),
                        ),
                        child: Center(
                          child: Icon(
                            Icons.add,
                            size: size * 0.25,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}

class CollabProfilePicture extends StatelessWidget {
  const CollabProfilePicture({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: 35,
        width: 40,
        child: CustomPaint(
          painter: CollabProfilePicturePainter(),
          size: Size.square(40),
        ));
  }
}

class MultipleFriendsProfilePicture extends StatelessWidget {
  const MultipleFriendsProfilePicture({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 20,
      width: 40,
      child: CustomPaint(
        painter: MultipleFriendsProfilePicturePainter(),
        size: Size(40, 20),
      ),
    );
  }
}
