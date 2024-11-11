import 'package:cupertino_app_design/views/bootom_navigation/provider/bootom_provider.dart';
import 'package:cupertino_app_design/views/home_page/screen/home_page.dart';
import 'package:cupertino_app_design/views/reels/view/reels.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class BootmNavigation extends StatefulWidget {
  const BootmNavigation({super.key});

  @override
  State<BootmNavigation> createState() => _BootmNavigationState();
}

class _BootmNavigationState extends State<BootmNavigation> {
  late BootomProvider bottomR, bottomW;

  List<Widget> screens = [HomePage(), ReelsPage()];
  @override
  Widget build(BuildContext context) {
    bottomR = context.read<BootomProvider>();
    bottomW = context.watch<BootomProvider>();
    return Scaffold(
      body: screens[bottomW.selectInx],

      //BottomNavigationBar --Material2--
      // bottomNavigationBar: BottomNavigationBar(
      //   currentIndex: bottomW.selectInx,
      //   onTap: (value) {
      //     bottomR.changeInx(value);
      //   },
      //   items: [
      //     BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
      //     BottomNavigationBarItem(icon: Icon(Icons.camera), label: "Reels")
      //   ],
      // ),

      //--Material3-- BottomNavigationBar
      bottomNavigationBar: NavigationBar(
        selectedIndex: bottomW.selectInx,
        onDestinationSelected: (value) {
          bottomR.changeInx(value);
        },
        destinations: [
          NavigationDestination(icon: Icon(Icons.home), label: "Home"),
          NavigationDestination(icon: Icon(Icons.camera), label: "Camera"),
        ],
      ),
    );
  }
}
