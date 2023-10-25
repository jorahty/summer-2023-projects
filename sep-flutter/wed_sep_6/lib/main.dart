import 'package:flutter/material.dart';

import 'home.dart';

void main() {
  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    const colorSchemeSeed = Colors.pink;

    return MaterialApp(
      home: const Home(),
      themeMode: ThemeMode.system,
      theme: ThemeData(
        useMaterial3: true,
        brightness: Brightness.light,
        colorSchemeSeed: colorSchemeSeed,
      ),
      darkTheme: ThemeData(
        useMaterial3: true,
        brightness: Brightness.dark,
        colorSchemeSeed: colorSchemeSeed,
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}
