import 'package:coffee_shop/pages/cart.dart';
import 'package:coffee_shop/pages/shop.dart';
import 'package:flutter/material.dart';

import 'package:coffee_shop/components/bottom_nav.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;

  void selectIndex(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  final List<Widget> _pages = [
    const ShopPage(),
    const CartPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      bottomNavigationBar: MyBottomNavBar(onTabChange: selectIndex),
      body: _pages[_selectedIndex],
    );
  }
}
