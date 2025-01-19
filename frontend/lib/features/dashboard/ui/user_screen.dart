import 'package:flutter/material.dart';
import 'package:frontend/features/dashboard/ui/settings_screen.dart';
import 'package:frontend/features/profile/ui/profile_screen.dart';
import 'package:frontend/features/test_attempt/ui/test_info_screen.dart';

class UserScreen extends StatefulWidget {
  const UserScreen({super.key});

  @override
  State<UserScreen> createState() => _UserScreenState();
}

class _UserScreenState extends State<UserScreen> {
  int _page = 0;
  double bottomBarWidth = 42;
  double bottomBarBorderWidth = 5;

  late List<Widget> pages = [
    const ProfileScreen(),
    const TestInfoScreen(),
    const SettingsScreen(),
  ];

  void updatePage(int page) {
    setState(() {
      _page = page;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF2F2F2),
      body: SafeArea(child: pages[_page]),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _page,
        selectedItemColor: const Color.fromARGB(255, 32, 8, 56),
        unselectedItemColor: const Color.fromARGB(255, 164, 130, 194),
        backgroundColor: const Color(0xFFF2F2F2),
        showUnselectedLabels: true,
        // iconSize: 28,
        onTap: updatePage,
        items: [
          /// my profile
          BottomNavigationBarItem(
            icon: SizedBox(
              width: bottomBarWidth,
              child: const Icon(
                Icons.home_outlined,
              ),
            ),
            label: 'Home',
          ),

          /// start test
          BottomNavigationBarItem(
            icon: SizedBox(
              width: bottomBarWidth,
              child: const Icon(
                Icons.pending_actions_sharp,
              ),
            ),
            label: 'FindMyPath',
          ),

          /// settings
          BottomNavigationBarItem(
            icon: SizedBox(
              width: bottomBarWidth,
              child: const Icon(
                Icons.settings,
              ),
            ),
            label: 'Settings',
          ),
        ],
      ),
    );
  }
}
