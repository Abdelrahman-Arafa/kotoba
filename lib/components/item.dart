
import 'package:flutter/material.dart';
import 'package:kotoba/models/Number.dart';

class Item extends StatelessWidget {
  const Item({Key? key, required this.number}) : super(key: key);
final Number number;
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.orange,
      height: 100,
      child: Row(children: [
        Container(
            color: const Color.fromARGB(255, 255, 230, 207),
            child: Image.asset(number.image)),
        Padding(
          padding: const EdgeInsets.only(left: 16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                number.jpName,
                style: const TextStyle(color: Colors.white, fontSize: 24),
              ),
              Text(number.enName,
                  style: const TextStyle(color: Colors.white, fontSize: 18)),
            ],
          ),
        ),
        const Spacer(flex: 1),
        const Padding(
          padding: EdgeInsets.only(right: 16),
          child: Icon(Icons.play_arrow, color: Colors.white, size: 30),
        ),
      ]),
    );
  }
}
