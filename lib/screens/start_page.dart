import 'dart:async';

import 'package:flutter/material.dart';
import 'package:kotoba/components/theme_toggle_action.dart';

class StartPage extends StatefulWidget {
  const StartPage({
    Key? key,
    required this.isDarkMode,
    required this.onToggleTheme,
    required this.onFinished,
  }) : super(key: key);

  final bool isDarkMode;
  final VoidCallback onToggleTheme;
  final VoidCallback onFinished;

  @override
  State<StartPage> createState() => _StartPageState();
}

class _StartPageState extends State<StartPage>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  late final Animation<double> _fadeAnimation;
  late final Animation<double> _scaleAnimation;
  bool _completed = false;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1200),
    );
    _fadeAnimation = CurvedAnimation(
      parent: _controller,
      curve: Curves.easeIn,
    );
    _scaleAnimation = Tween<double>(begin: 0.85, end: 1).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeOutBack),
    );
    _controller.forward();
    Timer(const Duration(milliseconds: 1800), _finish);
  }

  void _finish() {
    if (!mounted || _completed) {
      return;
    }
    _completed = true;
    widget.onFinished();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: widget.isDarkMode
                ? const [Color(0xFF1F1F1F), Color(0xFF2F2F2F)]
                : const [
                    Color.fromARGB(255, 255, 230, 207),
                    Color.fromARGB(255, 255, 194, 120),
                  ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: SafeArea(
          child: Stack(
            children: [
              Align(
                alignment: Alignment.topRight,
                child: Padding(
                  padding: const EdgeInsets.all(12),
                  child: ThemeToggleAction(
                    isDarkMode: widget.isDarkMode,
                    onPressed: widget.onToggleTheme,
                  ),
                ),
              ),
              Center(
                child: FadeTransition(
                  opacity: _fadeAnimation,
                  child: ScaleTransition(
                    scale: _scaleAnimation,
                    child: Padding(
                      padding: const EdgeInsets.all(24),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            width: 130,
                            height: 130,
                            decoration: BoxDecoration(
                              color: Colors.white.withAlpha(35),
                              borderRadius: BorderRadius.circular(32),
                            ),
                            child: const Icon(
                              Icons.menu_book_rounded,
                              size: 88,
                              color: Colors.brown,
                            ),
                          ),
                          const SizedBox(height: 24),
                          const Text(
                            'Kotoba',
                            style: TextStyle(
                              fontSize: 42,
                              fontWeight: FontWeight.bold,
                              color: Colors.brown,
                            ),
                          ),
                          const SizedBox(height: 12),
                          const Text(
                            'Learn Japanese words with colors, numbers, family, and phrases.',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 18,
                              color: Colors.brown,
                              height: 1.4,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
