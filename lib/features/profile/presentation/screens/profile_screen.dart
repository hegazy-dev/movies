import 'package:flutter/material.dart';
import 'package:movies/core/constants/app_assets.dart';
import 'package:movies/features/profile/domain/profile_update_result.dart';
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

  String _userName = 'John Safwat';
  String _phone = '01200000000';
  int _avatarIndex = 7;
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
                  avatarPath: AppAssets.avatars[_avatarIndex],
                ),
                const SizedBox(height: 23),
                ProfileActionButtons(
                  onEditProfile: () async {
                    final result = await Navigator.push<ProfileUpdateResult>(
                      context,
                      MaterialPageRoute(
                        builder: (context) => UpdateProfileScreen(
                          name: _userName,
                          phone: _phone,
                          avatarIndex: _avatarIndex,
                        ),
                      ),
                    );
                    if (result == null || !mounted) return;
                    setState(() {
                      _userName = result.name;
                      _phone = result.phone;
                      _avatarIndex = result.avatarIndex;
                    });
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
