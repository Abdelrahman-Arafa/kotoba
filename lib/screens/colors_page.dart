import 'package:flutter/material.dart';
import 'package:kotoba/components/item.dart';
import 'package:kotoba/components/theme_toggle_action.dart';
import 'package:kotoba/models/app_section.dart';
import 'package:kotoba/models/number_model.dart';
import 'package:kotoba/services/navigation_observer.dart';

class ColorsPage extends StatefulWidget {
  const ColorsPage({
    Key? key,
    required this.isDarkMode,
    required this.onToggleTheme,
    required this.onSectionChanged,
  }) : super(key: key);

  final bool isDarkMode;
  final VoidCallback onToggleTheme;
  final ValueChanged<AppSection> onSectionChanged;

  @override
  State<ColorsPage> createState() => _ColorsPageState();
}

class _ColorsPageState extends State<ColorsPage> with RouteAware {
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
    widget.onSectionChanged(AppSection.colors);
  }

  @override
  void didPopNext() {
    widget.onSectionChanged(AppSection.colors);
  }

  final List<Number> colors = const [
    Number(
      image: 'assets/images/colors/color_black.png',
      jpName: 'kuro',
      enName: 'black',
      sound: 'sounds/colors/black.wav',
    ),
    Number(
      image: 'assets/images/colors/color_brown.png',
      jpName: 'chairo',
      enName: 'brown',
      sound: 'sounds/colors/brown.wav',
    ),
    Number(
      image: 'assets/images/colors/color_dusty_yellow.png',
      jpName: 'hokori ppoi kiiro',
      enName: 'dusty yellow',
      sound: 'sounds/colors/dusty yellow.wav',
    ),
    Number(
      image: 'assets/images/colors/color_gray.png',
      jpName: 'haiiro',
      enName: 'gray',
      sound: 'sounds/colors/gray.wav',
    ),
    Number(
      image: 'assets/images/colors/color_green.png',
      jpName: 'midori',
      enName: 'green',
      sound: 'sounds/colors/green.wav',
    ),
    Number(
      image: 'assets/images/colors/color_red.png',
      jpName: 'aka',
      enName: 'red',
      sound: 'sounds/colors/red.wav',
    ),
    Number(
      image: 'assets/images/colors/color_white.png',
      jpName: 'shiro',
      enName: 'white',
      sound: 'sounds/colors/white.wav',
    ),
    Number(
      image: 'assets/images/colors/yellow.png',
      jpName: 'kiiro',
      enName: 'yellow',
      sound: 'sounds/colors/yellow.wav',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.brown,
        title: const Text('Colors', style: TextStyle(color: Colors.white)),
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
        itemCount: colors.length,
        itemBuilder: (context, index) =>
            Item(number: colors[index], itemColor: Colors.purple),
      ),
    );
  }
}
