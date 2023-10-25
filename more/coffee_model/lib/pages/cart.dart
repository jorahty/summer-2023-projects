import 'package:coffee_model/components/coffee/card.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../model/view_model.dart';
import '../data/coffee.dart';

class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  @override
  Widget build(BuildContext context) {
    var viewModel = context.watch<ViewModel>();

    return ListView.separated(
      itemBuilder: (context, index) {
        Coffee coffee = viewModel.cart[index];
        return CoffeeCard(
          coffee: coffee,
          icon: const Icon(Icons.delete),
          onPressed: () {
            viewModel.removeFromCart(coffee);
          },
        );
      },
      separatorBuilder: (context, index) => const SizedBox(height: 20),
      itemCount: viewModel.cart.length,
    );
  }
}
