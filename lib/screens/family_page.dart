import 'package:flutter/material.dart';
import 'package:kotoba/components/item.dart';
import 'package:kotoba/components/theme_toggle_action.dart';
import 'package:kotoba/models/app_section.dart';
import 'package:kotoba/models/number_model.dart';
import 'package:kotoba/services/navigation_observer.dart';

class FamilyPage extends StatefulWidget {
  const FamilyPage({
    Key? key,
    required this.isDarkMode,
    required this.onToggleTheme,
    required this.onSectionChanged,
  }) : super(key: key);

  final bool isDarkMode;
  final VoidCallback onToggleTheme;
  final ValueChanged<AppSection> onSectionChanged;

  @override
  State<FamilyPage> createState() => _FamilyPageState();
}

class _FamilyPageState extends State<FamilyPage> with RouteAware {
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
    widget.onSectionChanged(AppSection.family);
  }

  @override
  void didPopNext() {
    widget.onSectionChanged(AppSection.family);
  }

  final List<Number> familyMembers = const [
    Number(
      image: 'assets/images/family_members/family_father.png',
      jpName: 'chichioya',
      enName: 'father',
      sound: 'sounds/family_members/father.wav',
    ),
    Number(
      image: 'assets/images/family_members/family_mother.png',
      jpName: 'hahaoya',
      enName: 'mother',
      sound: 'sounds/family_members/mother.wav',
    ),
    Number(
      image: 'assets/images/family_members/family_grandfather.png',
      jpName: 'ojiisan',
      enName: 'grand father',
      sound: 'sounds/family_members/grand father.wav',
    ),
    Number(
      image: 'assets/images/family_members/family_grandmother.png',
      jpName: 'obaasan',
      enName: 'grand mother',
      sound: 'sounds/family_members/grand mother.wav',
    ),
    Number(
      image: 'assets/images/family_members/family_older_brother.png',
      jpName: 'oniisan',
      enName: 'older brother',
      sound: 'sounds/family_members/older bother.wav',
    ),
    Number(
      image: 'assets/images/family_members/family_older_sister.png',
      jpName: 'oneesan',
      enName: 'older sister',
      sound: 'sounds/family_members/older sister.wav',
    ),
    Number(
      image: 'assets/images/family_members/family_son.png',
      jpName: 'musuko',
      enName: 'son',
      sound: 'sounds/family_members/son.wav',
    ),
    Number(
      image: 'assets/images/family_members/family_daughter.png',
      jpName: 'musume',
      enName: 'daughter',
      sound: 'sounds/family_members/daughter.wav',
    ),
    Number(
      image: 'assets/images/family_members/family_younger_brother.png',
      jpName: 'otouto',
      enName: 'younger brother',
      sound: 'sounds/family_members/younger brohter.wav',
    ),
    Number(
      image: 'assets/images/family_members/family_younger_sister.png',
      jpName: 'imouto',
      enName: 'younger sister',
      sound: 'sounds/family_members/younger sister.wav',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.brown,
        title:
            const Text('Family Members', style: TextStyle(color: Colors.white)),
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
        itemCount: familyMembers.length,
        itemBuilder: (context, index) =>
            Item(number: familyMembers[index], itemColor: Colors.green),
      ),
    );
  }
}
