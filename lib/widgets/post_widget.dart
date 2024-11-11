import 'package:flutter/material.dart';
import 'package:instagram_clone_app/widgets/buttons/action_button_widgets.dart';
import 'package:instagram_clone_app/widgets/expandable_text.dart';
import 'package:instagram_clone_app/widgets/page_indicator.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import './profile_picture.dart';
import 'buttons/like_button.dart';

enum PostType {
  image,
  carousel,
  video,
}

class PostWidget extends StatelessWidget {
  final PostType postType;
  //final List<Widget> posts;
  PostWidget({
    super.key,
    // required this.posts,
    required this.postType,
  });

  @override
  Widget build(BuildContext context) {
    if (postType == PostType.image) {
      return ImagePostWidget();
    } else if (postType == PostType.video) {
      return VideoPostWidget();
    } else {
      return CarouselPostWidget();
    }
  }
}

class PostContent extends StatelessWidget {
  final List<Widget> posts;
  final PageController postsPageController;
  final List<double> aspectRatio;
  const PostContent(
      {super.key,
      required this.postsPageController,
      required this.posts,
      required this.aspectRatio});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      //height: 50,
      child: AspectRatio(
        aspectRatio: aspectRatio[0] / aspectRatio[1],
        child: Stack(
          children: [
            posts.length == 1
                ? PageView(
                    scrollDirection: Axis.horizontal,
                    controller: postsPageController,
                    children: List.generate(
                      posts.length,
                      (index) => FittedBox(
                        fit: BoxFit.cover,
                        clipBehavior: Clip.hardEdge,
                        child: posts[index],
                      ),
                    ),
                  )
                : Stack(
                    children: [
                      PageView(
                        scrollDirection: Axis.horizontal,
                        controller: postsPageController,
                        children: List.generate(
                          posts.length,
                          (index) => FittedBox(
                            fit: BoxFit.cover,
                            clipBehavior: Clip.hardEdge,
                            child: posts[index],
                          ),
                        ),
                      ),
                      Positioned(
                        top: 20,
                        right: 20,
                        child: DecoratedBox(
                          decoration: const BoxDecoration(
                            color: Colors.black54,
                            borderRadius: BorderRadius.horizontal(
                                right: Radius.circular(20),
                                left: Radius.circular(20)),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 8.0, vertical: 4),
                            child: Text(
                              "1/3",
                              style: const TextStyle(color: Colors.white),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
          ],
        ),
      ),
    );
  }
}

class VideoPostWidget extends StatelessWidget {
  const VideoPostWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        AspectRatio(
          aspectRatio: 0.65,
          child: Stack(
            children: [
              SizedBox(
                height: double.infinity,
                width: double.infinity,
                child: FittedBox(
                    fit: BoxFit.cover, child: Image.asset("assets/post.png")),
              ),
              Positioned(
                top: 0,
                left: 0,
                right: 0,
                height: 120,
                child: DecoratedBox(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        Colors.black.withOpacity(0.7),
                        Colors.transparent,
                      ],
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                    ),
                  ),
                ),
              ),
              Positioned(
                top: 0,
                left: 0,
                right: 0,
                child: PostDetails(
                  isVideo: true,
                ),
              ),
              Center(
                child: Icon(
                  Icons.play_arrow_rounded,
                  color: Colors.white,
                  size: 100,
                ),
              )
            ],
          ),
        ),
        Actions(),
        DescriptionWidget(),
        SizedBox(height: 20),
      ],
    );
  }
}

class ImagePostWidget extends StatelessWidget {
  const ImagePostWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        PostDetails(),
        AspectRatio(
          aspectRatio: 4 / 5,
          child: Image.asset("assets/mock_images/profile_pic_2.png"),
        ),
        Actions(),
        DescriptionWidget(),
        SizedBox(height: 20),
      ],
    );
  }
}

class CarouselPostWidget extends StatelessWidget {
  final PageController postsController = PageController();
  CarouselPostWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        PostDetails(),
        Stack(
          children: [
            AspectRatio(
              aspectRatio: 1,
              child: PageView(
                physics: ClampingScrollPhysics(),
                pageSnapping: true,
                scrollDirection: Axis.horizontal,
                controller: postsController,
                children: List.generate(
                  8,
                  (index) => FittedBox(
                    fit: BoxFit.cover,
                    clipBehavior: Clip.hardEdge,
                    child: Image.asset("assets/mock_images/profile_pic_1.png"),
                  ),
                ),
              ),
            ),
            Positioned(
              top: 20,
              right: 20,
              child: DecoratedBox(
                decoration: const BoxDecoration(
                  color: Colors.black54,
                  borderRadius: BorderRadius.horizontal(
                      right: Radius.circular(20), left: Radius.circular(20)),
                ),
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4),
                  child: Text(
                    "1/3",
                    style: const TextStyle(color: Colors.white),
                  ),
                ),
              ),
            ),
          ],
        ),
        SizedBox(height: 20),
        Center(
          child: PageIndicator(
            controller: postsController,
            pages: 8,
          ),
        ),
        Center(
          //TODO: Make urown implementation of this
          child: SmoothPageIndicator(
            onDotClicked: (index) {
              postsController.animateToPage(index,
                  duration: const Duration(milliseconds: 100),
                  curve: Curves.linear);
            },
            effect: CustomizableEffect(
              spacing: 5,
              dotDecoration: DotDecoration(
                width: 5,
                height: 5,
                borderRadius: BorderRadius.circular(5),
                color: Color(0xFFD9D9D9),
              ),
              activeDotDecoration: DotDecoration(
                width: 6,
                height: 6,
                borderRadius: BorderRadius.circular(7),
                color: Color(0xFF3897F0),
              ),
            ),
            controller: postsController,
            count: 8,
          ),
        ),
        Actions(),
        DescriptionWidget(),
        SizedBox(
          height: 20,
        )
      ],
    );
  }
}

class PostDetails extends StatelessWidget {
  final bool isVideo;
  final Color color;
  const PostDetails({super.key, this.isVideo = false})
      : color = isVideo ? Colors.white : Colors.black;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 8.0),
            child:
                // SizedBox.square(
                //   dimension: 30,
                //   child: StoryUnviewedProfilePicture(),
                SizedBox.square(dimension: 30, child: CollabProfilePicture()),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Username",
                style: TextStyle(fontWeight: FontWeight.bold, color: color),
              ),
              Text(
                "Username • Original audio",
                style: TextStyle(fontSize: 12, color: color),
              ),
            ],
          ),
          Spacer(),
          SizedBox(
            width: 65,
            height: 35,
            child: DecoratedBox(
              decoration: BoxDecoration(
                color: isVideo ? Colors.transparent : Color(0xFFEFEFEF),
                borderRadius: BorderRadius.circular(10),
                border: Border.fromBorderSide(
                  BorderSide(
                    width: 1,
                    color: isVideo ? color : Color(0xFFEFEFEF),
                  ),
                ),
              ),
              child: Center(
                  child: Text("Follow",
                      style: TextStyle(
                        color: color,
                      ))),
            ),
          ),
          SizedBox(
            width: 10,
          ),
          MoreButton(
            onPressed: () {},
            dimension: 25,
            color: color,
          ),
          SizedBox(
            width: 10,
          )
        ],
      ),
    );
  }
}

class Actions extends StatelessWidget {
  final bool isCarousel;
  final int? noOfPosts;
  final PageController? postsController;
  const Actions(
      {super.key,
      this.isCarousel = false,
      this.noOfPosts,
      this.postsController});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          LikeButton(onPressed: () {}, dimension: 25),
          const SizedBox(width: 5),
          Text("1M"),
          const SizedBox(width: 10),
          CommentButton(
            onPressed: () {},
            dimension: 25,
          ),
          const SizedBox(width: 5),
          Text("200K"),
          const SizedBox(width: 10),
          ShareButton(
            onPressed: () {},
            dimension: 25,
          ),
          const SizedBox(width: 5),
          Text("500K"),
          Spacer(),
          SaveButton(
            onPressed: () {},
            dimension: 25,
          ),
        ],
      ),
    );
  }
}

class DescriptionWidget extends StatelessWidget {
  const DescriptionWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              MultipleFriendsProfilePicture(),
              SizedBox(width: 5),
              RichText(
                  //softWrap: true,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  text: TextSpan(children: [
                    TextSpan(
                      text: "Liked by ",
                      style: TextStyle(
                        color: Colors.black,
                      ),
                    ),
                    TextSpan(
                      text: "Username ",
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    TextSpan(
                      text: "and others",
                      style: TextStyle(
                        color: Colors.black,
                      ),
                    ),
                  ])),
            ],
          ),
          ExpandableText(
            maxLines: 2,
            text: "This is a long text \nthat should be truncated initially "
                "but \ncan be expanded to show the full content. "
                "Tap on Show more to expand and Show less to collapse",
            style: TextStyle(color: Colors.black),
          ),
          // RichText(
          //     //softWrap: true,
          //     maxLines: 2,
          //     overflow: TextOverflow.ellipsis,
          //     text: TextSpan(children: [
          //       TextSpan(
          //         text: "Username ",
          //         style: TextStyle(
          //           fontWeight: FontWeight.bold,
          //           color: Colors.black,
          //         ),
          //       ),
          //       TextSpan(
          //         text: "ODOUDBOUDBOBUOUUUUUUUUUUUUUUUUUUUUUUUUUUUUU"
          //             "DOBUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUDOUOOU"
          //             "DOUDBOUUUUUUUUUUUUUUUUUUUUUUUUUUUUUU",
          //         style: TextStyle(
          //           color: Colors.black,
          //         ),
          //       ),
          //     ])),
          Text("View all Comments"),
          Text("15 hours ago"),
        ],
      ),
    );
  }
}
