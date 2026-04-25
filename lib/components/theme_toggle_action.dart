import 'package:flutter/material.dart';

class ThemeToggleAction extends StatelessWidget {
  const ThemeToggleAction({
    Key? key,
    required this.isDarkMode,
    required this.onPressed,
  }) : super(key: key);

  final bool isDarkMode;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      tooltip: isDarkMode ? 'Switch to light mode' : 'Switch to dark mode',
      onPressed: onPressed,
      icon: Icon(
        isDarkMode ? Icons.light_mode_outlined : Icons.dark_mode_outlined,
        color: Colors.white,
      ),
    );
  }
}
