import 'package:flutter/material.dart';

import 'pages/home.dart';
import 'pages/saved.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  var _selectedIndex = 0;

  void selectIndex(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  static const _pages = [
    HomePage(),
    SavedPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LayoutBuilder(
        builder: (context, constraints) {
          if (constraints.maxWidth < 450) {
            return Column(
              children: [
                Expanded(child: _pages[_selectedIndex]),
                BottomNavigationBar(
                  currentIndex: _selectedIndex,
                  onTap: selectIndex,
                  items: const [
                    BottomNavigationBarItem(
                      label: 'Home',
                      icon: Icon(Icons.home),
                    ),
                    BottomNavigationBarItem(
                      label: 'Saved',
                      icon: Icon(Icons.turned_in),
                    ),
                  ],
                ),
              ],
            );
          }

          return Row(
            children: [
              NavigationRail(
                selectedIndex: _selectedIndex,
                onDestinationSelected: selectIndex,
                labelType: NavigationRailLabelType.all,
                destinations: const [
                  NavigationRailDestination(
                    label: Text('Home'),
                    icon: Icon(Icons.home),
                  ),
                  NavigationRailDestination(
                    label: Text('Saved'),
                    icon: Icon(Icons.turned_in),
                  ),
                ],
              ),
              Expanded(child: _pages[_selectedIndex]),
            ],
          );
        },
      ),
    );
  }
}
