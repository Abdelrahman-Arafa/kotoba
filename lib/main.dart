import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:kotoba/models/app_section.dart';
import 'package:kotoba/screens/colors_page.dart';
import 'package:kotoba/screens/family_page.dart';
import 'package:kotoba/screens/home_page.dart';
import 'package:kotoba/screens/numbers_page.dart';
import 'package:kotoba/screens/phrases_page.dart';
import 'package:kotoba/screens/start_page.dart';
import 'package:kotoba/services/navigation_observer.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const Kotoba());
}

class Kotoba extends StatefulWidget {
  const Kotoba({Key? key}) : super(key: key);

  @override
  State<Kotoba> createState() => _KotobaState();
}

class _KotobaState extends State<Kotoba> {
  static const _themeModeKey = 'theme_mode';
  static const _lastSectionKey = 'last_section';

  ThemeMode _themeMode = ThemeMode.light;
  AppSection _lastSection = AppSection.home;
  bool _prefsLoaded = false;
  bool _showSplash = true;

  @override
  void initState() {
    super.initState();
    _loadPreferences();
  }

  Future<void> _loadPreferences() async {
    try {
      final preferences = await SharedPreferences.getInstance();
      final themeValue = preferences.getString(_themeModeKey);
      final sectionValue = preferences.getString(_lastSectionKey);

      if (!mounted) {
        return;
      }

      setState(() {
        _themeMode = themeValue == 'dark' ? ThemeMode.dark : ThemeMode.light;
        _lastSection = _sectionFromKey(sectionValue);
        _prefsLoaded = true;
      });
    } catch (_) {
      if (!mounted) {
        return;
      }

      setState(() {
        _themeMode = ThemeMode.light;
        _lastSection = AppSection.home;
        _prefsLoaded = true;
      });
    }
  }

  AppSection _sectionFromKey(String? key) {
    switch (key) {
      case 'numbers':
        return AppSection.numbers;
      case 'colors':
        return AppSection.colors;
      case 'family':
        return AppSection.family;
      case 'phrases':
        return AppSection.phrases;
      case 'home':
      default:
        return AppSection.home;
    }
  }

  String _sectionToKey(AppSection section) {
    switch (section) {
      case AppSection.home:
        return 'home';
      case AppSection.numbers:
        return 'numbers';
      case AppSection.colors:
        return 'colors';
      case AppSection.family:
        return 'family';
      case AppSection.phrases:
        return 'phrases';
    }
  }

  Future<void> _saveThemeMode(ThemeMode themeMode) async {
    try {
      final preferences = await SharedPreferences.getInstance();
      await preferences.setString(
        _themeModeKey,
        themeMode == ThemeMode.dark ? 'dark' : 'light',
      );
    } catch (_) {}
  }

  Future<void> _saveLastSection(AppSection section) async {
    if (_lastSection == section) {
      return;
    }

    if (!mounted) {
      return;
    }

    // Defer setState to avoid calling it during build phase
    SchedulerBinding.instance.addPostFrameCallback((_) {
      if (!mounted) {
        return;
      }
      setState(() {
        _lastSection = section;
      });
    });

    try {
      final preferences = await SharedPreferences.getInstance();
      await preferences.setString(_lastSectionKey, _sectionToKey(section));
    } catch (_) {}
  }

  void _toggleTheme() {
    final nextThemeMode =
        _themeMode == ThemeMode.dark ? ThemeMode.light : ThemeMode.dark;
    setState(() {
      _themeMode = nextThemeMode;
    });
    _saveThemeMode(nextThemeMode);
  }

  void _finishSplash() {
    if (!_showSplash) {
      return;
    }
    setState(() {
      _showSplash = false;
    });
  }

  Widget _buildBootScreen() {
    return const Scaffold(
      body: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      navigatorObservers: [routeObserver],
      theme: ThemeData(
        brightness: Brightness.light,
        primarySwatch: Colors.brown,
        scaffoldBackgroundColor: const Color.fromARGB(255, 255, 230, 207),
      ),
      darkTheme: ThemeData(
        brightness: Brightness.dark,
        primarySwatch: Colors.brown,
        scaffoldBackgroundColor: const Color(0xFF121212),
      ),
      themeMode: _themeMode,
      home: !_prefsLoaded
          ? _buildBootScreen()
          : _showSplash
              ? StartPage(
                  isDarkMode: _themeMode == ThemeMode.dark,
                  onToggleTheme: _toggleTheme,
                  onFinished: _finishSplash,
                )
              : HomePage(
                  isDarkMode: _themeMode == ThemeMode.dark,
                  onToggleTheme: _toggleTheme,
                  onSectionChanged: _saveLastSection,
                ),
      onGenerateRoute: (settings) {
        final isDarkMode = _themeMode == ThemeMode.dark;

        switch (settings.name) {
          case '/numbers':
            return MaterialPageRoute(
              builder: (context) => NumbersPage(
                isDarkMode: isDarkMode,
                onToggleTheme: _toggleTheme,
                onSectionChanged: _saveLastSection,
              ),
            );
          case '/colors':
            return MaterialPageRoute(
              builder: (context) => ColorsPage(
                isDarkMode: isDarkMode,
                onToggleTheme: _toggleTheme,
                onSectionChanged: _saveLastSection,
              ),
            );
          case '/family':
            return MaterialPageRoute(
              builder: (context) => FamilyPage(
                isDarkMode: isDarkMode,
                onToggleTheme: _toggleTheme,
                onSectionChanged: _saveLastSection,
              ),
            );
          case '/phrases':
            return MaterialPageRoute(
              builder: (context) => PhrasesPage(
                isDarkMode: isDarkMode,
                onToggleTheme: _toggleTheme,
                onSectionChanged: _saveLastSection,
              ),
            );
          default:
            return null;
        }
      },
    );
  }
}
