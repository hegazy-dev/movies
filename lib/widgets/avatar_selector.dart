import 'package:flutter/material.dart';

class AvatarSelector extends StatefulWidget {
  const AvatarSelector({super.key});

  @override
  State<AvatarSelector> createState() => _AvatarSelectorState();
}

class _AvatarSelectorState extends State<AvatarSelector> {
  final PageController _pageController = PageController(
    viewportFraction: 0.30,
    initialPage: 1,
  );

  int selectedIndex = 1;

  final List<String> avatars = [
    "assets/images/avatar_1.png",
    "assets/images/avatar_2.png",
    "assets/images/avatar_3.png",
  ];

  @override
  void dispose() {
    _pageController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 140,
          child: PageView.builder(
            controller: _pageController,
            itemCount: avatars.length,
            onPageChanged: (index) {
              setState(() {
                selectedIndex = index;
              });
            },
            itemBuilder: (context, index) {
              bool isSelected = index == selectedIndex;

              return GestureDetector(
                onTap: () {
                  _pageController.animateToPage(
                    index,
                    duration: Duration(milliseconds: 300),
                    curve: Curves.easeInOut,
                  );
                },
                child: AnimatedScale(
                  scale: isSelected ? 1.0 : 0.62,
                  duration: Duration(milliseconds: 250),
                  curve: Curves.easeInOut,
                  child: ClipOval(
                    child: Image.asset(avatars[index], fit: .contain),
                  ),
                ),
              );
            },
          ),
        ),

        SizedBox(height: 2),

        Text("Avatar"),
      ],
    );
  }
}
