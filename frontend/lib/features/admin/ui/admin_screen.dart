import 'package:flutter/material.dart';
import 'package:frontend/features/admin/ui/admin_home.dart';
import 'package:frontend/features/admin/ui/widgets/analytics_screen.dart';
import 'package:frontend/features/dashboard/ui/settings_screen.dart';

class AdminScreen extends StatefulWidget {
  const AdminScreen({super.key});

  @override
  State<AdminScreen> createState() => _AdminScreenState();
}

class _AdminScreenState extends State<AdminScreen> {
  int _page = 0;
  double bottomBarWidth = 42;
  double bottomBarBorderWidth = 5;

  late List<Widget> pages = [
    const AdminHome(),
    const AnalyticsScreen(),
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

          /// analytics
          BottomNavigationBarItem(
            icon: SizedBox(
              width: bottomBarWidth,
              child: const Icon(
                Icons.analytics_outlined,
              ),
            ),
            label: 'Analytics',
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
