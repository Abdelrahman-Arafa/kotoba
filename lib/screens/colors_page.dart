import 'package:flutter/material.dart';

class ColorsPage extends StatelessWidget {
  const ColorsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.brown,
        title: const Text('Colors', style: TextStyle(color: Colors.white)),
      ),
      body: Container(
        child:
            Row(children: [Image.asset("assets/images/colors/color_red.png")]),
      ),
    );
  }
}
