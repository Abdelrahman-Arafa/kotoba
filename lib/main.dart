import 'package:flutter/material.dart';
import 'screens/home_page.dart';

void main() {
  runApp(const kotoba());
}

class kotoba extends StatelessWidget {
  const kotoba({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(debugShowCheckedModeBanner: false, home: HomePage());
  }
}
