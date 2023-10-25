import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

import 'models/favorites.dart';
import 'pages/home.dart';
import 'pages/favorites.dart';

void main() {
  runApp(const TestingApp());
}

final _router = GoRouter(
  routes: [
    GoRoute(
      path: HomePage.path,
      builder: (context, state) => const HomePage(),
      routes: [
        GoRoute(
          path: FavoritesPage.path,
          builder: (context, state) => const FavoritesPage(),
        ),
      ],
    ),
  ],
);

class TestingApp extends StatelessWidget {
  const TestingApp({super.key});

  @override
  Widget build(BuildContext context) {
    const colorSchemeSeed = Colors.pink;

    return ChangeNotifierProvider<Favorites>(
      create: (context) => Favorites(),
      child: MaterialApp.router(
        debugShowCheckedModeBanner: false,
        title: 'Testing Sample',
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
        routerConfig: _router,
      ),
    );
  }
}
