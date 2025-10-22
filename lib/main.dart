import 'package:flutter/material.dart';
import 'screens/home_page.dart';

void main() {
  runApp(const Kotoba());
}

class Kotoba extends StatelessWidget {
  const Kotoba({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(debugShowCheckedModeBanner: false, home: HomePage());
  }
}
