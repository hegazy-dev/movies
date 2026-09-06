import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:movies/core/constants/app_assets.dart';

class ProfileBottomNav extends StatelessWidget {
  final ValueChanged<int>? onItemSelected;

  const ProfileBottomNav({
    super.key,
    this.onItemSelected,
  });

  @override
  Widget build(BuildContext context) {
    final bottomInset = MediaQuery.paddingOf(context).bottom;

    return Padding(
      padding: EdgeInsets.fromLTRB(9, 0, 9, 9 + bottomInset),
      child: SizedBox(
        height: 61,
        width: double.infinity,
        child: Stack(
          fit: StackFit.expand,
          children: [
            SvgPicture.asset(
              AppAssets.bottomNav,
              width: 413,
              height: 61,
              fit: BoxFit.fill,
            ),
            Row(
              children: List.generate(4, (index) {
                return Expanded(
                  child: GestureDetector(
                    behavior: HitTestBehavior.opaque,
                    onTap: () => onItemSelected?.call(index),
                    child: const SizedBox.expand(),
                  ),
                );
              }),
            ),
          ],
        ),
      ),
    );
  }
}
