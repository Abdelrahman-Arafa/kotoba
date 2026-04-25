import 'package:flutter/material.dart';
import 'package:kotoba/components/item.dart';
import 'package:kotoba/components/theme_toggle_action.dart';
import 'package:kotoba/models/app_section.dart';
import 'package:kotoba/models/number_model.dart';
import 'package:kotoba/services/navigation_observer.dart';

class NumbersPage extends StatefulWidget {
  const NumbersPage({
    Key? key,
    required this.isDarkMode,
    required this.onToggleTheme,
    required this.onSectionChanged,
  }) : super(key: key);

  final bool isDarkMode;
  final VoidCallback onToggleTheme;
  final ValueChanged<AppSection> onSectionChanged;

  @override
  State<NumbersPage> createState() => _NumbersPageState();
}

class _NumbersPageState extends State<NumbersPage> with RouteAware {
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
    widget.onSectionChanged(AppSection.numbers);
  }

  @override
  void didPopNext() {
    widget.onSectionChanged(AppSection.numbers);
  }

  final List<Number> numbers = const [
    Number(
      image: 'assets/images/numbers/number_one.png',
      jpName: 'ichi',
      enName: 'one',
      sound: 'sounds/numbers/number_one_sound.mp3',
    ),
    Number(
      image: 'assets/images/numbers/number_two.png',
      jpName: 'ni',
      enName: 'two',
      sound: 'sounds/numbers/number_two_sound.mp3',
    ),
    Number(
      image: 'assets/images/numbers/number_three.png',
      jpName: 'san',
      enName: 'three',
      sound: 'sounds/numbers/number_three_sound.mp3',
    ),
    Number(
      image: 'assets/images/numbers/number_four.png',
      jpName: 'shi',
      enName: 'four',
      sound: 'sounds/numbers/number_four_sound.mp3',
    ),
    Number(
      image: 'assets/images/numbers/number_five.png',
      jpName: 'go',
      enName: 'five',
      sound: 'sounds/numbers/number_five_sound.mp3',
    ),
    Number(
      image: 'assets/images/numbers/number_six.png',
      jpName: 'roku',
      enName: 'six',
      sound: 'sounds/numbers/number_six_sound.mp3',
    ),
    Number(
      image: 'assets/images/numbers/number_seven.png',
      jpName: 'nana',
      enName: 'seven',
      sound: 'sounds/numbers/number_seven_sound.mp3',
    ),
    Number(
      image: 'assets/images/numbers/number_eight.png',
      jpName: 'hachi',
      enName: 'eight',
      sound: 'sounds/numbers/number_eight_sound.mp3',
    ),
    Number(
      image: 'assets/images/numbers/number_nine.png',
      jpName: 'kyuu',
      enName: 'nine',
      sound: 'sounds/numbers/number_nine_sound.mp3',
    ),
    Number(
      image: 'assets/images/numbers/number_ten.png',
      jpName: 'juu',
      enName: 'ten',
      sound: 'sounds/numbers/number_ten_sound.mp3',
    ),
  ];
  @override
  Widget build(BuildContext context) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.brown,
        title: const Text('Numbers', style: TextStyle(color: Colors.white)),
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
        itemCount: numbers.length,
        itemBuilder: (context, index) =>
            Item(number: numbers[index], itemColor: Colors.orange),
      ),
    );
  }
}
