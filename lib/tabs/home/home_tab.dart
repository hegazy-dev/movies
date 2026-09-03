import 'package:flutter/material.dart';
import 'package:movies/theme/app_colors.dart';
import 'package:movies/theme/app_text_styles.dart';
import 'package:movies/widgets/movie_card.dart';

class HomeTab extends StatefulWidget {
  const HomeTab({super.key});

  @override
  State<HomeTab> createState() => _HomeTabState();
}

class _HomeTabState extends State<HomeTab> {
  late PageController pageController;

  int currentIndex = 0;

  @override
  void initState() {
    super.initState();

    pageController = PageController(
      viewportFraction: 0.45,
      initialPage: 0,
    );
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.sizeOf(context);
    TextTheme textTheme = AppTextStyles.textTheme;

    return SingleChildScrollView(
      child: Column(
        children: [

          // Available Now
          Padding(
            padding: const EdgeInsets.only(
              right: 82,
              left: 81,
              top: 7,
            ),
            child: Image.asset(
              'assets/images/available.png',
              height: screenSize.height * .14,
              width: screenSize.width * .62,
              fit: BoxFit.fill,
            ),
          ),

          const SizedBox(height: 21),

          // Available Movies
          SizedBox(
            height: screenSize.height * .25,
            child: PageView.builder(
              controller: pageController,
              itemCount: 5,

              onPageChanged: (index) {
                setState(() {
                  currentIndex = index;
                });
              },

              itemBuilder: (context, index) {
                return AnimatedScale(
                  scale: currentIndex == index ? 1.0 : 0.78,
                  duration: const Duration(milliseconds: 200),
                  child: MovieCard(
                    imageUrl: 'assets/images/card.png',
                    rating: 7.2,
                  ),
                );
              },
            ),
          ),

          const SizedBox(height: 21),

          // Watch Now
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 38),
            child: Image.asset(
              'assets/images/watch_now.png',
              height: screenSize.height * .14,
              width: screenSize.width * .62,
              fit: BoxFit.fill,
            ),
          ),

          const SizedBox(height: 6),

          // Action Header
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Row(
              children: [
                Text(
                  'Action',
                  style: textTheme.titleLarge,
                ),

                const Spacer(),

                Text(
                  'See More',
                  style: textTheme.titleLarge?.copyWith(
                    color: AppColors.primary,
                  ),
                ),

                const SizedBox(width: 4),

                const Icon(
                  Icons.arrow_forward_ios,
                  size: 14,
                ),
              ],
            ),
          ),

          const SizedBox(height: 12),

          // Action Movies
          SizedBox(
            height: screenSize.height * .20,
            child: ListView.separated(
              padding: const EdgeInsets.only(left: 16),
              scrollDirection: Axis.horizontal,
              itemCount: 5,

              separatorBuilder: (context, index) {
                return const SizedBox(width: 16);
              },

              itemBuilder: (context, index) {
                return MovieCard(
                  imageUrl: 'assets/images/card.png',
                  rating: 7.2,
                );
              },
            ),
          ),

          const SizedBox(height: 20),
        ],
      ),
    );
  }
}