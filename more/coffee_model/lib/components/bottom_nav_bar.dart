import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

class BottomNavBar extends StatelessWidget {
  const BottomNavBar({super.key, required this.onTabChange});

  final void Function(int) onTabChange;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(25),
      child: GNav(
        onTabChange: onTabChange,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        activeColor: const Color.fromARGB(255, 56, 38, 221),
        tabBackgroundColor: const Color.fromARGB(255, 183, 184, 255),
        tabs: const [
          GButton(
            icon: Icons.home,
            text: 'Shop',
          ),
          GButton(
            icon: Icons.shopping_bag_outlined,
            text: 'Cart',
          ),
        ],
      ),
    );
  }
}
