import 'package:flutter/widgets.dart';

import '../data/coffee.dart';

class ViewModel extends ChangeNotifier {
  final List<Coffee> _shop = [
    Coffee(
      name: 'Cold Coffee',
      price: '4.99',
      image: 'images/cold-coffee.png',
    ),
    Coffee(
      name: 'Hot Coffee',
      price: '2.99',
      image: 'images/hot-coffee.png',
    ),
    Coffee(
      name: 'Hot Tea',
      price: '1.99',
      image: 'images/hot-tea.png',
    ),
    Coffee(
      name: 'Hot Brew',
      price: '7.99',
      image: 'images/hot.png',
    ),
  ];

  final List<Coffee> _cart = [];

  List<Coffee> get shop => _shop;

  List<Coffee> get cart => _cart;

  void addToCart(Coffee coffee) {
    if (cart.contains(coffee)) return;
    cart.add(coffee);
    notifyListeners();
  }

  void removeFromCart(Coffee coffee) {
    cart.remove(coffee);
    notifyListeners();
  }
}
