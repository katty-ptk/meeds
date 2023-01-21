import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:meeds/screens/app/add_new/add_new.dart';
import 'package:meeds/screens/app/home_screen.dart';
import 'package:meeds/screens/app/profile/profile.dart';
import 'package:meeds/utils/meeds_colors.dart';

class NavigationScreen extends StatefulWidget {
  const NavigationScreen({super.key});

  @override
  State<NavigationScreen> createState() => _NavigationScreenState();
}

class _NavigationScreenState extends State<NavigationScreen> {
  int tab_index = 0;

  final screens = [
    HomeScreen(),
    AddNew(),
    ProfileScreen()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: screens[tab_index],
      bottomNavigationBar: CurvedNavigationBar(
        height: 65,
        backgroundColor: Colors.white,
        color: MyColors.dark_purple,
        buttonBackgroundColor: Colors.white,
        animationDuration: Duration(milliseconds: 300),
        index: 0,
        onTap: (index) => setState(() {
          tab_index = index;
        }),
        items: [
          Icon(Icons.home_filled, color: tab_index == 0 ? MyColors.dark_purple : Colors.white,),
          Icon(Icons.add_circle_sharp, color: tab_index == 1 ? MyColors.dark_purple : Colors.white,),
          Icon(Icons.person, color: tab_index == 2 ? MyColors.dark_purple : Colors.white,)
        ],
      ),
    );
  }
}