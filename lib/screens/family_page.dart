import 'package:flutter/material.dart';

class FamilyPage extends StatelessWidget {
  const FamilyPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.brown,
        title:
            const Text('Family Members', style: TextStyle(color: Colors.white)),
      ),
      body: Container(
        child: Row(children: [
          Image.asset("assets/images/family_members/family_father.png")
        ]),
      ),
    );
  }
}
