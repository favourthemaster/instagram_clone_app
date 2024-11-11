import 'package:instagram_clone_app/utils/user_state.dart';

import 'posts_model.dart';

class User {
  final int id = 0;
  String username;
  List<int> followers = [];
  List<int> following = [];
  UserState userState = UserState.normal;
  List<Posts> posts = [];

  User({
    required this.username,
    this.following = const [],
    this.followers = const [],
    this.userState = UserState.normal,
    this.posts = const [],
  });

  //Start a livestream
  void startLive() {
    userState = UserState.live;
  }

  //Stop a livestream
  void stopLive() {
    //TODO: Add functionality so that it detects whether there is a story which has been viewed or not to change to the appropriate uerstate
    userState = UserState.normal;
  }

  //add a follower
  void addFollower(int id) {
    followers.add(id);
  }

  //add a following
  void addFollowing(int id) {
    following.add(id);
  }
}
