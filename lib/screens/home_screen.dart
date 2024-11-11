import 'package:flutter/material.dart';
import 'package:instagram_clone_app/widgets/buttons/action_button_widgets.dart';
import 'package:instagram_clone_app/widgets/instagram_name.dart';

import '../widgets/post_widget.dart';
import '../widgets/stories_widget.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({super.key}) {}

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late ScrollController _controller;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _controller = ScrollController();
  }

  @override
  void dispose() {
    _controller.removeListener(
      () {},
    );
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        height: MediaQuery.sizeOf(context).height,
        child: Stack(
          children: [
            Positioned(
                top: 0,
                left: 0,
                right: 0,
                height: 250,
                child: Center(
                  child: CircularProgressIndicator(
                    color: Colors.grey,
                    strokeWidth: 1,
                  ),
                )),
            Listener(
              onPointerUp: (_) {
                if (_controller.position.outOfRange &&
                    _controller.position.pixels < -80 &&
                    _controller.position.pixels != -80) {
                  print("method called");
                  _controller.position
                      .moveTo(-80,
                          duration: const Duration(milliseconds: 200),
                          curve: Curves.linear,
                          clamp: false)
                      .whenComplete(
                        () => _controller.position.hold(
                          () {
                            print("method ended");
                          },
                        ),
                      );
                  // _controller.position.setPixels(-150);
                }
              },
              child: CustomScrollView(
                // / shrinkWrap: true,
                physics: BouncingScrollPhysics(),
                controller: _controller,
                slivers: [
                  SliverAppBar(
                    stretch: false,
                    snap: true,
                    floating: true,
                    automaticallyImplyLeading: false,
                    backgroundColor: Colors.white,
                    scrolledUnderElevation: 0,
                    toolbarHeight: 60,
                    bottom: PreferredSize(
                      preferredSize: Size.fromHeight(0.1),
                      child: Divider(
                        height: 1,
                        color: Colors.grey.withOpacity(0.2),
                      ),
                    ),
                    title: GestureDetector(
                      onTap: () {},
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          SizedBox(
                            width: 110,
                            height: 30,
                            child: InstagramName(),
                          ),
                          Icon(Icons.keyboard_arrow_down)
                        ],
                      ),
                    ),
                    actionsIconTheme: IconThemeData(
                      size: 30,
                    ),
                    actions: [
                      Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10.0),
                          child: NotificationButton(
                            onPressed: () {},
                            dimension: 25,
                          )),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10.0),
                        child: Badge(
                          backgroundColor: Colors.red,
                          offset: Offset(6, -6),
                          label: Text("2"),
                          child: ChatButton(
                            onPressed: () {},
                            dimension: 25,
                          ),
                        ),
                      ),
                    ],
                  ),
                  SliverList(
                    delegate: SliverChildListDelegate(
                      [
                        ColoredBox(
                          color: Colors.white,
                          child: Column(
                            children: [
                              StoriesWidget(),
                              Divider(
                                height: 1,
                                color: Colors.grey.withOpacity(0.2),
                              ),
                              CarouselPostWidget(),
                              ImagePostWidget(),
                              VideoPostWidget(),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// StoriesWidget(),
// Divider(
// height: 1,
// color: Colors.grey.withOpacity(0.2),
// ),
// CarouselPostWidget(),
// ImagePostWidget(),
// VideoPostWidget(),
