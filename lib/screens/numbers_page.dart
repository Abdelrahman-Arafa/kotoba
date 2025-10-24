import 'package:flutter/material.dart';
import 'package:kotoba/models/Number.dart';
import 'package:kotoba/components/item.dart';

class NumbersPage extends StatelessWidget {
  const NumbersPage({Key? key}) : super(key: key);
  final one = const Number(
      image: 'assets/images/numbers/number_one.png',
      jpName: 'ichi',
      enName: 'one');
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.brown,
        title: const Text('Numbers', style: TextStyle(color: Colors.white)),
      ),
      body: ListView(
        children: [
          Item(number: one), //1
          Item(number: one), //2
          Item(number: one), //3
          Item(number: one), //4
          Item(number: one), //5
          Item(number: one), //6
          Item(number: one), //7
          Item(number: one), //8
          Item(number: one), //9
          Item(number: one), //10
        ],
      ),
    );
  }
}
