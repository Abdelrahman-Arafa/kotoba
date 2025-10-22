import 'package:flutter/material.dart';
import 'package:language_app/components/category_item.dart';
import 'package:language_app/screens/numbers_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 255, 248, 216),
      appBar: AppBar(
        title: const Text(' Kotoba', style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.brown,
      ),
      body: Column(
        children: [
          Category(
            text: "NUMBERS",
            color: Colors.orange,
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return const NumbersPage();
                  },
                ),
              );
            },
          ),
          Category(text: "family members", color: Colors.green, onTap: () {}),
          Category(text: "colors", color: Colors.purple, onTap: () {}),
          Category(text: "phrases", color: Colors.cyan, onTap: () {}),
        ],
      ),
    );
  }
}
