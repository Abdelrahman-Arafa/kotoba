import 'package:flutter/material.dart';

class PhrasesPage extends StatelessWidget {
  const PhrasesPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.brown,
        title: const Text('Phrases', style: TextStyle(color: Colors.white)),
      ),
      body: Container(
        child: const Center(
          child: Text(
            'Phrases coming soon!',
            style: TextStyle(fontSize: 24, color: Colors.brown),
          ),
        ),
      ),
    );
  }
}
