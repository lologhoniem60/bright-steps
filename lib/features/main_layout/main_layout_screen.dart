import 'package:flutter/material.dart';

import '../../core/resources/colors_manager.dart';
import '../../core/resources/strings_manager.dart';
import 'tabs/faq/faq_screen.dart';
import 'tabs/home/home_screen.dart';
import 'tabs/more/more_screen.dart';
import 'tabs/tips/tips_screen.dart';

class MainLayoutScreen extends StatefulWidget {
  const MainLayoutScreen({super.key});

  @override
  State<MainLayoutScreen> createState() => _MainLayoutScreenState();
}

class _MainLayoutScreenState extends State<MainLayoutScreen> {
  int _selectedNavIndex = 0;

  final List<Widget> _tabs = const [
    HomeScreen(),
    TipsScreen(),
    FaqScreen(),
    MoreScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsManager.white,
      body: IndexedStack(
        index: _selectedNavIndex,
        children: _tabs,
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedNavIndex,
        onTap: (index) => setState(() => _selectedNavIndex = index),
        type: BottomNavigationBarType.fixed,
        selectedItemColor: ColorsManager.blue,
        unselectedItemColor: ColorsManager.muted,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home_outlined),
            activeIcon: Icon(Icons.home_rounded),
            label: StringsManager.home,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.help_outline_rounded),
            activeIcon: Icon(Icons.help_rounded),
            label: StringsManager.tips,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.article_outlined),
            activeIcon: Icon(Icons.article_rounded),
            label: StringsManager.faq,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.more_horiz_rounded),
            label: StringsManager.more,
          ),
        ],
      ),
    );
  }
}
