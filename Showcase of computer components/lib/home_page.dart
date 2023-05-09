import 'package:flutter/material.dart';
import 'package:showcase_of_computer_components/components/bottom_navbar.dart';
import 'package:showcase_of_computer_components/cart_page.dart';
import 'package:showcase_of_computer_components/shop_page.dart';
import 'package:showcase_of_computer_components/save_page.dart';
import 'package:showcase_of_computer_components/profile_page.dart';
import 'package:showcase_of_computer_components/signup_page.dart';
import 'package:showcase_of_computer_components/login_page.dart';
import 'package:showcase_of_computer_components/utils/colors.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _selectedIndex = 0;

  void navigateBottomBar(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  Future<bool?> _onWillPop() async {
    final shouldPop = await showMyDialog();
    return shouldPop ?? false;
  }

  Future<bool> showMyDialog() async {
    final result = await showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(
          "Вы действительно хотите выйти?",
          overflow: TextOverflow.ellipsis,
          style: TextStyle(fontSize: 16),
        ),
        actions: [
          TextButton(
            child: Text(
              'Отмена',
              style: TextStyle(fontSize: 13),
            ),
            onPressed: () => Navigator.pop(context,false),
            style: ButtonStyle(
              foregroundColor: MaterialStateProperty.all<Color>(kblackClr),
            ),
          ),
          TextButton(
            child: Text(
              'Выйти',
              style: TextStyle(fontSize: 13),
            ),
            onPressed: () => Navigator.pop(context,true),
            style: ButtonStyle(
              foregroundColor: MaterialStateProperty.all<Color>(kblackClr),
            ),
          ),
        ],
      ),
    );
    return result ?? false;
  }

  final List<Widget> _pages = [
    const ShopPage(),
    SavePage(selectedIndex: 2), // pass the selected index here
    const ProfilePage(),
    const CartPage(),
    const LoginPage(),
    const SignupPage()
  ];

  @override
  Widget build(BuildContext context) => WillPopScope(
    onWillPop: showMyDialog,
    child: Scaffold(
      backgroundColor: kwhiteClr,
      bottomNavigationBar: NavBar(
        currentIndex: _selectedIndex,
        onTabChange: (index) => navigateBottomBar(index),
      ),
      body: _pages[_selectedIndex],
    ),
  );
}

