import 'package:coffee_model/components/coffee/card.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../data/coffee.dart';
import '../model/view_model.dart';

class ShopPage extends StatefulWidget {
  const ShopPage({super.key});

  @override
  State<ShopPage> createState() => _ShopPageState();
}

class _ShopPageState extends State<ShopPage> {
  @override
  Widget build(BuildContext context) {
    var viewModel = context.watch<ViewModel>();

    return Column(
      children: [
        const Padding(
          padding: EdgeInsets.all(20),
          child: Text(
            'How would you like your coffee?',
            style: TextStyle(fontSize: 24),
          ),
        ),
        Expanded(
          child: ListView.separated(
            itemCount: viewModel.shop.length,
            itemBuilder: (context, index) {
              Coffee coffee = viewModel.shop[index];
              return CoffeeCard(
                coffee: coffee,
                icon: const Icon(Icons.add),
                onPressed: () {
                  viewModel.addToCart(coffee);

                  showDialog(
                    context: context,
                    builder: (context) => const AlertDialog(
                      title: Text(
                        'Added to cart!',
                      ),
                    ),
                  );
                },
              );
            },
            separatorBuilder: (context, index) {
              return const SizedBox(height: 20);
            },
          ),
        )
      ],
    );
  }
}
