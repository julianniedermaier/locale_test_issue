import 'package:flutter/material.dart';
import 'package:flutter_localized_locales/flutter_localized_locales.dart';
import 'package:locale_test_issue/l10n/app_localizations.dart';

void main() => runApp(const MyApp());


class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Locale _currentLocale = const Locale('en');

  void _toggleLanguage() {
    setState(() {
      if (_currentLocale.languageCode == 'en') {
        _currentLocale = const Locale('ar');
      } else {
        _currentLocale = const Locale('en');
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHomePage(onToggleLanguage: _toggleLanguage),
      localizationsDelegates: const [
        ...AppLocalizations.localizationsDelegates,
        LocaleNamesLocalizationsDelegate(),
      ],
      locale: _currentLocale,
      supportedLocales: AppLocalizations.supportedLocales,
    );
  }
}


class MyHomePage extends StatelessWidget {
  final VoidCallback onToggleLanguage;

  const MyHomePage({super.key, required this.onToggleLanguage});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(AppLocalizations.of(context).languageName)),
      body: Center(
        child: ElevatedButton(
          onPressed: onToggleLanguage,
          child: Text(AppLocalizations.of(context).changeLanguage),
        ),
      ),
    );
  }
}
