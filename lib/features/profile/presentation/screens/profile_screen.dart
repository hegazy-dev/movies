import 'package:flutter/material.dart';
import 'package:movies/core/constants/app_assets.dart';
import 'package:movies/features/profile/presentation/screens/update_profile_screen.dart';
import 'package:movies/features/profile/presentation/widgets/empty_watchlist.dart';
import 'package:movies/features/profile/presentation/widgets/movie_grid.dart';
import 'package:movies/features/profile/presentation/widgets/profile_action_buttons.dart';
import 'package:movies/features/profile/presentation/widgets/profile_bottom_nav.dart';
import 'package:movies/features/profile/presentation/widgets/profile_header.dart';
import 'package:movies/features/profile/presentation/widgets/profile_tabs.dart';
import 'package:movies/theme/app_colors.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  int _selectedTab = 0;

  final String _userName = 'John Safwat';
  final int _wishListCount = 12;
  final int _historyCount = 10;

  @override
  Widget build(BuildContext context) {
    final topInset = MediaQuery.paddingOf(context).top;

    return Scaffold(
      backgroundColor: AppColors.background,
      body: Column(
        children: [
          ColoredBox(
            color: AppColors.header,
            child: Column(
              children: [
                SizedBox(height: topInset > 0 ? topInset + 8 : 52),
                ProfileHeader(
                  userName: _userName,
                  wishListCount: _wishListCount,
                  historyCount: _historyCount,
                ),
                const SizedBox(height: 23),
                ProfileActionButtons(
                  onEditProfile: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const UpdateProfileScreen(),
                      ),
                    );
                  },
                  onExit: () {},
                ),
                const SizedBox(height: 20),
                ProfileTabs(
                  selectedIndex: _selectedTab,
                  onTabChanged: (index) {
                    setState(() {
                      _selectedTab = index;
                    });
                  },
                ),
              ],
            ),
          ),
          Expanded(
            child: _selectedTab == 0
                ? const EmptyWatchlist()
                : MovieGrid(posterPaths: AppAssets.historyPosters),
          ),
          const ProfileBottomNav(),
        ],
      ),
    );
  }
}
