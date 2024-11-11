import 'package:flutter/material.dart';
import 'package:instagram_clone_app/screens/home_screen.dart';
import 'package:instagram_clone_app/screens/profile_screen.dart';
import 'package:instagram_clone_app/themes.dart';
import 'package:instagram_clone_app/widgets/buttons/action_button_widgets.dart';
import 'package:instagram_clone_app/widgets/profile_picture.dart';

void main() {
  runApp(const MyApp());
}

List<Widget> screens = [
  HomeScreen(),
  Scaffold(),
  Scaffold(),
  Scaffold(),
  ProfileScreen(),
];

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      color: Colors.white,
      debugShowCheckedModeBanner: false,
      theme: Themes.lightTheme,
      home: MainScreen(),
    );
  }
}

class MainScreen extends StatelessWidget {
  final PageController controller = PageController();
  MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        physics: NeverScrollableScrollPhysics(),
        controller: controller,
        children: screens,
      ),
      bottomNavigationBar: BottomNavigationBar(
        onTap: (i) {
          controller.jumpToPage(i);
        },
        elevation: 5,
        showUnselectedLabels: false,
        showSelectedLabels: false,
        type: BottomNavigationBarType.fixed,
        iconSize: 30,
        backgroundColor: Colors.white,
        items: [
          BottomNavigationBarItem(
            label: "",
            icon: Padding(
              padding: const EdgeInsets.all(4.0),
              child: HomeButton(
                onPressed: () {},
                dimension: 30,
              ),
            ),
          ),
          BottomNavigationBarItem(
            label: "",
            icon: Padding(
                padding: const EdgeInsets.all(4.0),
                child: SearchButton(
                  onPressed: () {},
                  dimension: 30,
                )),
          ),
          BottomNavigationBarItem(
            label: "",
            icon: Padding(
              padding: const EdgeInsets.all(4.0),
              child: AddPostButton(
                onPressed: () {},
                dimension: 30,
              ),
            ),
          ),
          BottomNavigationBarItem(
            label: "",
            icon: Padding(
              padding: const EdgeInsets.all(4.0),
              child: ReelsButton(
                onPressed: () {},
                dimension: 30,
              ),
            ),
          ),
          const BottomNavigationBarItem(
            label: "",
            activeIcon: SizedBox.square(dimension: 30, child: ProfilePicture()),
            icon: SizedBox.square(dimension: 30, child: ProfilePicture()),
          ),
        ],
      ),
    );
  }
}
