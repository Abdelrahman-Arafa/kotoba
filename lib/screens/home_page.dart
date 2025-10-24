import 'package:flutter/material.dart';
import 'numbers_page.dart';
import 'colors_page.dart';
import 'family_page.dart';
import 'phrases_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 255, 230, 207),
      appBar: AppBar(
        backgroundColor: Colors.brown,
        title: const Text('Kotoba', style: TextStyle(color: Colors.white)),
      ),
      body: Column(
        children: [
          Category(
            text: 'Numbers',
            color: Colors.orange,
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(builder: (_) => const NumbersPage()),
              );
            },
          ),
          Category(
            text: 'Colors',
            color: Colors.purple,
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(builder: (_) => const ColorsPage()),
              );
            },
          ),
          Category(
            text: 'Family Members',
            color: Colors.green,
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(builder: (_) => const FamilyPage()),
              );
            },
          ),
          Category(
            text: 'Phrases',
            color: Colors.blue,
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(builder: (_) => const PhrasesPage()),
              );
            },
          ),
        ],
      ),
    );
  }
}

class Category extends StatelessWidget {
  final String text;
  final Color color;
  final VoidCallback onTap;

  const Category({
    Key? key,
    required this.text,
    required this.color,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 80,
        color: color,
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        alignment: Alignment.centerLeft,
        child: Text(
          text,
          style: const TextStyle(
            fontSize: 18,
            color: Colors.white,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }
}
