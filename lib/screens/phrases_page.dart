import 'package:flutter/material.dart';
import 'package:kotoba/components/phrase_item.dart';
import 'package:kotoba/components/theme_toggle_action.dart';
import 'package:kotoba/models/app_section.dart';
import 'package:kotoba/models/phrase_model.dart';
import 'package:kotoba/services/navigation_observer.dart';

class PhrasesPage extends StatefulWidget {
  const PhrasesPage({
    Key? key,
    required this.isDarkMode,
    required this.onToggleTheme,
    required this.onSectionChanged,
  }) : super(key: key);

  final bool isDarkMode;
  final VoidCallback onToggleTheme;
  final ValueChanged<AppSection> onSectionChanged;

  @override
  State<PhrasesPage> createState() => _PhrasesPageState();
}

class _PhrasesPageState extends State<PhrasesPage> with RouteAware {
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final route = ModalRoute.of(context);
    if (route is PageRoute) {
      routeObserver.subscribe(this, route);
    }
  }

  @override
  void dispose() {
    routeObserver.unsubscribe(this);
    super.dispose();
  }

  @override
  void didPush() {
    widget.onSectionChanged(AppSection.phrases);
  }

  @override
  void didPopNext() {
    widget.onSectionChanged(AppSection.phrases);
  }

  final List<Phrase> phrases = const [
    Phrase(
      jpName: 'Kimasu ka',
      enName: 'Are you coming?',
      sound: 'sounds/phrases/are_you_coming.wav',
    ),
    Phrase(
      jpName: 'Kōdoku o wasurenaide',
      enName: "Don't forget to subscribe",
      sound: 'sounds/phrases/dont_forget_to_subscribe.wav',
    ),
    Phrase(
      jpName: 'Go kibun wa ikagadesu ka',
      enName: 'How are you feeling?',
      sound: 'sounds/phrases/how_are_you_feeling.wav',
    ),
    Phrase(
      jpName: 'Watashi wa anime ga daisuki desu',
      enName: 'I love anime',
      sound: 'sounds/phrases/i_love_anime.wav',
    ),
    Phrase(
      jpName: 'Watashi wa puroguramingu ga daisuki desu',
      enName: 'I love programming',
      sound: 'sounds/phrases/i_love_programming.wav',
    ),
    Phrase(
      jpName: 'Puroguramingu wa kantan desu',
      enName: 'Programming is easy',
      sound: 'sounds/phrases/programming_is_easy.wav',
    ),
    Phrase(
      jpName: 'Namae wa nandesu ka',
      enName: 'What is your name?',
      sound: 'sounds/phrases/what_is_your_name.wav',
    ),
    Phrase(
      jpName: 'Doko ni ikimasu ka',
      enName: 'Where are you going?',
      sound: 'sounds/phrases/where_are_you_going.wav',
    ),
    Phrase(
      jpName: 'Hai, watashi mo ikimasu',
      enName: 'Yes, I am coming',
      sound: 'sounds/phrases/yes_im_coming.wav',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.brown,
        title: const Text('Phrases', style: TextStyle(color: Colors.white)),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.of(context).pop(),
        ),
        actions: [
          ThemeToggleAction(
            isDarkMode: isDarkMode,
            onPressed: widget.onToggleTheme,
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: phrases.length,
        itemBuilder: (context, index) => PhraseItem(phrase: phrases[index]),
      ),
    );
  }
}
