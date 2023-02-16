import 'package:flutter/material.dart';
import 'package:instagram/src/components/image_data.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      child: Scaffold(
        appBar: AppBar(),
        body: Container(),
        bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          showSelectedLabels: false,
          showUnselectedLabels: false,
          currentIndex: 0,
          elevation: 0,
          onTap: (value) {},
          items: [
            BottomNavigationBarItem(
              icon: ImageData(IconPath.homeOff),
              activeIcon: ImageData(IconPath.homeOn),
              label: 'home',
            ),
            BottomNavigationBarItem(
              icon: ImageData(IconPath.searchOff),
              activeIcon: ImageData(IconPath.searchOn),
              label: 'home',
            ),
            BottomNavigationBarItem(
              icon: ImageData(IconPath.uploadIcon),
              label: 'home',
            ),
            BottomNavigationBarItem(
              icon: ImageData(IconPath.activeOff),
              activeIcon: ImageData(IconPath.activeOn),
              label: 'home',
            ),
            BottomNavigationBarItem(
              icon: Container(
                width: 30,
                height: 30,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.grey,
                ),
              ),
              label: 'home',
            ),
          ],
        ),
      ),
      onWillPop: () async {
        return false;
      },
    );
  }
}
