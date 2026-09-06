import 'package:flutter/material.dart';
import 'package:movies/core/constants/app_assets.dart';

class EmptyWatchlist extends StatelessWidget {
  const EmptyWatchlist({super.key});

  @override
  Widget build(BuildContext context) {
    final size = (MediaQuery.sizeOf(context).width * 0.288).clamp(96.0, 124.0);

    return Center(
      child: Image.asset(
        AppAssets.emptyWatchlist,
        width: size,
        height: size,
        fit: BoxFit.contain,
      ),
    );
  }
}
