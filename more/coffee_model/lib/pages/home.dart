import 'package:flutter/material.dart';

import '../components/bottom_nav_bar.dart';
import 'shop.dart';
import 'cart.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int selectedIndex = 0;

  void _selectIndex(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  final List<Widget> _pages = const [
    ShopPage(),
    CartPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        centerTitle: false,
        backgroundColor: const Color.fromARGB(255, 107, 91, 253),
        title: const Text(
          'Coffee Shop',
          style: TextStyle(color: Colors.white),
        ),
      ),
      bottomNavigationBar: BottomNavBar(
        onTabChange: _selectIndex,
      ),
      body: _pages[selectedIndex],
    );
  }
}
