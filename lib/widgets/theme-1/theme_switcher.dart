import 'package:flutter/material.dart';
import 'colors.dart';

class ThemeSwitcher extends StatelessWidget {
  final bool isTheme1;
  final VoidCallback onToggle;

  ThemeSwitcher({required this.isTheme1, required this.onToggle});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          'Switch Theme',
          style: TextStyle(
            color: isTheme1 ? lightTextColor : darkTextColor,
          ),
        ),
        Switch(
          value: isTheme1,
          onChanged: (value) {
            onToggle();
          },
        ),
      ],
    );
  }
}
