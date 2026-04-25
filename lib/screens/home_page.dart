import 'package:flutter/material.dart';
import 'package:kotoba/components/category_item.dart';
import 'package:kotoba/components/theme_toggle_action.dart';
import 'package:kotoba/models/app_section.dart';
import 'package:kotoba/services/navigation_observer.dart';

class HomePage extends StatefulWidget {
  const HomePage({
    Key? key,
    required this.isDarkMode,
    required this.onToggleTheme,
    required this.onSectionChanged,
  }) : super(key: key);

  final bool isDarkMode;
  final VoidCallback onToggleTheme;
  final ValueChanged<AppSection> onSectionChanged;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with RouteAware {
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
    widget.onSectionChanged(AppSection.home);
  }

  @override
  void didPopNext() {
    widget.onSectionChanged(AppSection.home);
  }

  void _openPage(BuildContext context, AppSection section, String routeName) {
    widget.onSectionChanged(section);
    Navigator.of(context).pushNamed(routeName);
  }

  String _routeFromSection(AppSection section) {
    switch (section) {
      case AppSection.numbers:
        return '/numbers';
      case AppSection.colors:
        return '/colors';
      case AppSection.family:
        return '/family';
      case AppSection.phrases:
        return '/phrases';
      case AppSection.home:
        return '/';
    }
  }

  Widget _buildIconIllustration(IconData icon) {
    return Icon(
      icon,
      size: 64,
      color: Colors.white,
    );
  }

  @override
  Widget build(BuildContext context) {
    final categories = [
      _HomeCategory(
        text: 'Numbers',
        color: Colors.orange,
        illustration: _buildIconIllustration(Icons.looks_one),
        section: AppSection.numbers,
      ),
      _HomeCategory(
        text: 'Colors',
        color: Colors.purple,
        illustration: _buildIconIllustration(Icons.palette),
        section: AppSection.colors,
      ),
      _HomeCategory(
        text: 'Family Members',
        color: Colors.green,
        illustration: _buildIconIllustration(Icons.groups),
        section: AppSection.family,
      ),
      _HomeCategory(
        text: 'Phrases',
        color: Colors.blue,
        illustration: _buildIconIllustration(Icons.chat_bubble_outline),
        section: AppSection.phrases,
      ),
    ];

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.brown,
        title: const Text('Kotoba', style: TextStyle(color: Colors.white)),
        actions: [
          ThemeToggleAction(
            isDarkMode: widget.isDarkMode,
            onPressed: widget.onToggleTheme,
          ),
        ],
      ),
      body: LayoutBuilder(
        builder: (context, constraints) {
          return Center(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: ConstrainedBox(
                constraints: BoxConstraints(
                  maxWidth: constraints.maxWidth,
                  maxHeight: constraints.maxHeight,
                ),
                child: GridView.count(
                  crossAxisCount: 2,
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  crossAxisSpacing: 16,
                  mainAxisSpacing: 16,
                  childAspectRatio: 0.98,
                  children: categories
                      .map(
                        (category) => CategoryCard(
                          text: category.text,
                          color: category.color,
                          illustration: category.illustration,
                          onTap: () => _openPage(
                            context,
                            category.section,
                            _routeFromSection(category.section),
                          ),
                        ),
                      )
                      .toList(),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

class _HomeCategory {
  const _HomeCategory({
    required this.text,
    required this.color,
    required this.illustration,
    required this.section,
  });

  final String text;
  final Color color;
  final Widget illustration;
  final AppSection section;
}
