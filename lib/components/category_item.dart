import 'package:flutter/material.dart';

class CategoryCard extends StatelessWidget {
  const CategoryCard({
    Key? key,
    required this.text,
    required this.color,
    required this.illustration,
    this.onTap,
  }) : super(key: key);

  final String text;
  final Color color;
  final Widget illustration;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    final shadowColor = color.withAlpha((0.35 * 255).round());

    return Semantics(
      button: true,
      label: text,
      child: Material(
        color: color,
        borderRadius: BorderRadius.circular(20),
        elevation: 6,
        shadowColor: shadowColor,
        clipBehavior: Clip.antiAlias,
        child: InkWell(
          onTap: onTap,
          child: Container(
            width: double.infinity,
            padding: const EdgeInsets.all(16),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(child: Center(child: illustration)),
                const SizedBox(height: 12),
                Text(
                  text,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 22,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
