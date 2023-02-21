import 'package:carrot_market_sample/page/favorite.dart';
import 'package:carrot_market_sample/page/home.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  late int _currentPageIndex;

  @override
  void initState() {
    super.initState();
    _currentPageIndex = 0;
  }

  Widget _bodyWidget() {
    switch (_currentPageIndex) {
      case 0:
        return const Home();
      case 4:
        return const MyFavoriteContents();
      default:
        return Container();
    }
  }

  BottomNavigationBarItem _bottomNavigationBarItem(
      {required String iconName, required String label}) {
    return BottomNavigationBarItem(
      icon: Padding(
        padding: const EdgeInsets.only(bottom: 5),
        child: SvgPicture.asset("assets/svg/${iconName}_off.svg", width: 22),
      ),
      activeIcon: Padding(
        padding: const EdgeInsets.only(bottom: 5),
        child: SvgPicture.asset("assets/svg/${iconName}_on.svg", width: 22),
      ),
      label: label,
    );
  }

  BottomNavigationBar _bottomNavigationBarWidget() {
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      onTap: (index) {
        setState(() {
          _currentPageIndex = index;
        });
      },
      currentIndex: _currentPageIndex,
      selectedItemColor: Colors.black,
      selectedFontSize: 12,
      items: [
        _bottomNavigationBarItem(iconName: 'home', label: '홈'),
        _bottomNavigationBarItem(iconName: 'notes', label: '동네생활'),
        _bottomNavigationBarItem(iconName: 'location', label: '내 근처'),
        _bottomNavigationBarItem(iconName: 'chat', label: '채팅'),
        _bottomNavigationBarItem(iconName: 'user', label: '내 당근'),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _bodyWidget(),
      bottomNavigationBar: _bottomNavigationBarWidget(),
    );
  }
}
