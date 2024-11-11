import 'package:cupertino_app_design/views/home_page/screen/home_ios_page.dart';
import 'package:cupertino_app_design/views/profile/profile_ios.dart';
import 'package:cupertino_app_design/views/profile/slidingProfile.dart';
import 'package:flutter/cupertino.dart';

class TabBarIos extends StatefulWidget {
  const TabBarIos({super.key});

  @override
  State<TabBarIos> createState() => _TabBarIosState();
}

class _TabBarIosState extends State<TabBarIos> {
  List screens = [HomeIosPage(), ProfilePageIos(), SlidingprofileIos()];
  @override
  Widget build(BuildContext context) {
    return CupertinoTabScaffold(
      tabBar: CupertinoTabBar(
        items: [
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.home),
            label: "Home",
          ),
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.profile_circled),
            label: "Profile",
          ),
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.person_crop_circle_fill_badge_checkmark),
            label: "Sliding Profile",
          ),
        ],
      ),
      tabBuilder: (context, index) {
        return CupertinoTabView(
          builder: (context) {
            return screens[index];
          },
        );
      },
    );
  }
}
