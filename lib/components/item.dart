import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:kotoba/models/number_model.dart';

class Item extends StatelessWidget {
  const Item({
    Key? key,
    required this.number,
    this.itemColor = Colors.orange,
  }) : super(key: key);

  final Number number;
  final Color itemColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: itemColor,
      height: 100,
      child: Row(
        children: [
          Container(
            width: 100,
            color: const Color.fromARGB(255, 255, 230, 207),
            child: Image.asset(
              number.image,
              width: 100,
              height: double.infinity,
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) =>
                  const Icon(Icons.broken_image, color: Colors.brown),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(left: 16),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    number.jpName,
                    softWrap: true,
                    style: const TextStyle(color: Colors.white, fontSize: 24),
                  ),
                  Text(
                    number.enName,
                    softWrap: true,
                    style: const TextStyle(color: Colors.white, fontSize: 18),
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 16),
            child: IconButton(
                onPressed: () async {
                  final player = AudioPlayer();
                  await player.play(AssetSource(number.sound));
                },
                icon: const Icon(Icons.play_arrow,
                    color: Colors.white, size: 30)),
          ),
        ],
      ),
    );
  }
}
