import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:showcase_of_computer_components/my_icons_icons.dart';
import 'package:showcase_of_computer_components/utils/colors.dart';

class NavBar extends StatefulWidget {
  final int currentIndex;
  final void Function(int)? onTabChange;

  NavBar({Key? key, required this.currentIndex, required this.onTabChange}) : super(key: key);

  @override
  _NavBarState createState() => _NavBarState();
}

class _NavBarState extends State<NavBar> {
  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      backgroundColor: kwhiteClr,
      type: BottomNavigationBarType.fixed,
      elevation: 5,
      showSelectedLabels: true,
      showUnselectedLabels: true,
      selectedItemColor: kprimaryClr,
      unselectedItemColor: kgrayClr,
      onTap: (index) {
        widget.onTabChange?.call(index);
      },
      selectedLabelStyle: const TextStyle(fontSize: 13, fontWeight: FontWeight.normal),
      unselectedLabelStyle: const TextStyle(fontSize: 13, fontWeight: FontWeight.normal),
      currentIndex: widget.currentIndex,
      items: const [
        BottomNavigationBarItem(
          icon: SizedBox(
            height: 18,
            width: 15,
            child: FaIcon(
              MyIcons.vector__stroke___1_,
              size: 15,
            ),
          ),
          label: "Главная",
        ),
        BottomNavigationBarItem(
          icon: SizedBox(
            height: 18,
            width: 15,
            child: FaIcon(
              MyIcons.vector_3,
              size: 15,
            ),
          ),
          label: "Избранное",
        ),
        BottomNavigationBarItem(
          icon: SizedBox(
            height: 18,
            width: 15,
            child: FaIcon(
              MyIcons.vector_1,
              size: 15,
            ),
          ),
          label: "Профиль",
        ),
        BottomNavigationBarItem(
          icon: SizedBox(
            height: 18,
            width: 15,
            child: FaIcon(
              MyIcons.vector,
              size: 15,
            ),
          ),
          label: "Корзина",
        ),
      ],
    );
  }
}
