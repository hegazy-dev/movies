import 'package:flutter/material.dart';
import 'package:movies/tabs/browse/browse_tab.dart';
import 'package:movies/tabs/home/home_tab.dart';
import 'package:movies/tabs/profile/profile_tab.dart';
import 'package:movies/tabs/search/search_tab.dart';
import 'package:movies/widgets/active_nav_bar_icon.dart';
import 'package:movies/widgets/icactive_nav_bar_icon.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName = '/home';

  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int currentIndex = 0;

  final List<Widget> tabs = [
    HomeTab(),
    SearchTab(),
    BrowseTab(),
    ProfileTab(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      

      body: SafeArea(
        child: tabs[currentIndex],
      ),

      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex,

        onTap: (index) {
          setState(() {
            currentIndex = index;
          });
        },

        items: [
          BottomNavigationBarItem(
            icon: IcactiveNavBarIcon(
              iconName: 'home',
            ),
            activeIcon: ActiveNavBarIcon(
              iconName: 'home',
            ),
            label: 'home',
          ),

          BottomNavigationBarItem(
            icon: IcactiveNavBarIcon(
              iconName: 'search',
            ),
            activeIcon: ActiveNavBarIcon(
              iconName: 'search',
            ),
            label: 'search',
          ),

          BottomNavigationBarItem(
            icon: IcactiveNavBarIcon(
              iconName: 'explore',
            ),
            activeIcon: ActiveNavBarIcon(
              iconName: 'explore',
            ),
            label: 'explore',
          ),

          BottomNavigationBarItem(
            icon: IcactiveNavBarIcon(
              iconName: 'profile',
            ),
            activeIcon: ActiveNavBarIcon(
              iconName: 'profile',
            ),
            label: 'profile',
          ),
        ],
      ),
    );
  }
}