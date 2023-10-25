import 'package:flutter/material.dart';

class Favorites extends ChangeNotifier {
  final List<int> _items = []; // itemIndices?
  List<int> get items => _items;

  void add(int item) {
    _items.add(item); // index?
    notifyListeners();
  }

  void remove(int item) {
    _items.remove(item);
    notifyListeners();
  }
}
