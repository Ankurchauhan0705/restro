import 'package:flutter/material.dart';

class BottomNavigation extends StatefulWidget {
  final int bottomSelectedIndex;
  final Function bottomTapped;

  const BottomNavigation(
      {Key? key, required this.bottomSelectedIndex, required this.bottomTapped})
      : super(key: key);

  @override
  _BottomNavigationState createState() => _BottomNavigationState();
}

class _BottomNavigationState extends State<BottomNavigation> {
  List<BottomNavigationBarItem> bulidBottomNavBarItem = [
    const BottomNavigationBarItem(
        label: "Home",
        icon: ImageIcon(AssetImage(
          "assets/images/icons/homeicon.png",
        )),
        activeIcon:
            ImageIcon(AssetImage("assets/images/icons/unhomeicon.png"))),
    const BottomNavigationBarItem(
        label: "Menu",
        icon: ImageIcon(AssetImage(
          "assets/images/icons/menuicon.png",
        )),
        activeIcon:
            ImageIcon(AssetImage("assets/images/icons/unmenuicon.png"))),

    const BottomNavigationBarItem(
        label: "",
        icon: Column()),

    const BottomNavigationBarItem(
        label: "Book A Table",
        icon: ImageIcon(AssetImage(
          "assets/images/icons/bookatableicon.png",
        )),
        activeIcon:
            ImageIcon(AssetImage("assets/images/icons/unbookatableicon.png"))),
    const BottomNavigationBarItem(
        label: "Profile",
        icon: ImageIcon(AssetImage(
          "assets/images/icons/profile.png",
        )),
        activeIcon: ImageIcon(AssetImage("assets/images/icons/unprofile.png"))),
  ];

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      items: bulidBottomNavBarItem,

      //enableFeedback: false,
      selectedItemColor: Color(0xff41004C),
      unselectedItemColor: Color(0xffD3D1D8),
      elevation: 0,
      backgroundColor: Colors.white,
      showUnselectedLabels: true,
      showSelectedLabels: true,
      currentIndex: widget.bottomSelectedIndex,
      onTap: (index) => widget.bottomTapped(index),
      selectedFontSize: 12,
      unselectedFontSize: 10,
    );
  }
}
