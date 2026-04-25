import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:kotoba/models/phrase_model.dart';

class PhraseItem extends StatelessWidget {
  const PhraseItem({Key? key, required this.phrase}) : super(key: key);

  final Phrase phrase;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.blue,
      constraints: const BoxConstraints(minHeight: 100),
      child: Row(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    phrase.jpName,
                    softWrap: true,
                    style: const TextStyle(color: Colors.white, fontSize: 24),
                  ),
                  Text(
                    phrase.enName,
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
              padding: EdgeInsets.zero,
              constraints: const BoxConstraints(),
              onPressed: () async {
                final player = AudioPlayer();
                await player.play(AssetSource(phrase.sound));
              },
              icon: const Icon(Icons.play_arrow, color: Colors.white, size: 30),
            ),
          ),
        ],
      ),
    );
  }
}
