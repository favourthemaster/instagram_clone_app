import 'package:flutter/material.dart';
import 'package:instagram_clone_app/widgets/profile_picture.dart';
import 'package:instagram_clone_app/widgets/story_widget.dart';

class StoriesWidget extends StatelessWidget {
  const StoriesWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return ColoredBox(
      color: Colors.white,
      child: SizedBox(
        height: 100,
        child: ListView(
          scrollDirection: Axis.horizontal,
          children: const [
            SizedBox(
              width: 4,
            ),
            Column(
              children: [
                AddStoryProfilePicture(),
                Text(
                  "Your Story",
                  softWrap: false,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontSize: 12,
                  ),
                ),
              ],
            ),
            StoryWidget(),
            StoryWidget(),
            StoryWidget(),
            StoryWidget(),
            StoryWidget(),
            SizedBox(
              width: 4,
            ),
          ]
              .map(
                (e) => Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 4),
                    child: e),
              )
              .toList(),
        ),
      ),
    );
  }
}
