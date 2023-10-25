import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

import '../models/favorites.dart';
import 'favorites.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  static String path = '/';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        title: const Text('Testing Sample'),
        actions: <Widget>[
          TextButton.icon(
            onPressed: () {
              context.go('/${FavoritesPage.path}');
            },
            icon: const Icon(Icons.favorite_border),
            label: const Text('Favorites'),
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: 100,
        cacheExtent: 20,
        itemBuilder: (context, index) => ItemTile(index),
      ),
    );
  }
}

class ItemTile extends StatelessWidget {
  const ItemTile(this.index, {super.key});

  final int index;

  @override
  Widget build(BuildContext context) {
    var favorites = context.watch<Favorites>();

    return ListTile(
      leading: CircleAvatar(
        backgroundColor: Colors.primaries[index % Colors.primaries.length],
      ),
      title: Text(
        'Item $index',
        key: Key('text_$index'),
      ),
      trailing: IconButton(
        key: Key('icon_$index'),
        icon: favorites.items.contains(index)
            ? const Icon(Icons.favorite)
            : const Icon(Icons.favorite_border),
        onPressed: () {
          if (favorites.items.contains(index)) {
            favorites.remove(index);
          } else {
            favorites.add(index);
          }
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(
                favorites.items.contains(index)
                    ? 'Added to favorites.'
                    : 'Removed from favorites.',
              ),
              duration: const Duration(seconds: 1),
            ),
          );
        },
      ),
    );
  }
}
