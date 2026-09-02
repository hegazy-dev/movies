import 'package:flutter/material.dart';

class DefaultElevatedButton extends StatelessWidget {
  String label;
  VoidCallback onPressed;
  Widget? icon;

  DefaultElevatedButton({
    required this.label,
    required this.onPressed,
    this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        fixedSize: Size(MediaQuery.sizeOf(context).width, 48),
      ),
      child: icon == null
          ? Text(label)
          : Row(
              mainAxisAlignment: .center,
              children: [icon!, SizedBox(width: 8), Text(label)],
            ),
    );
  }
}
