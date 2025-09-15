import 'package:flutter/material.dart';
import 'views/home_page.dart';
import 'providers/theme_provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<ThemeData>(
      valueListenable: ThemeProvider.themeNotifier,
      builder: (context, theme, _) => MaterialApp(
        title: 'Surendra\'s Portfolio',
        theme: theme,
        home: const HomePage(),
      ),
    );
  }
}
