import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/favorites.dart';

class FavoritesPage extends StatelessWidget {
  const FavoritesPage({super.key});

  static String path = 'favorites_page';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Favorites'),
      ),
      body: Consumer<Favorites>(
        builder: (context, value, child) => ListView.builder(
          itemCount: value.items.length,
          itemBuilder: (context, index) => FavoriteItemTile(value.items[index]),
        ),
      ),
    );
  }
}

class FavoriteItemTile extends StatelessWidget {
  const FavoriteItemTile(this.index, {super.key});

  final int index;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(
        backgroundColor: Colors.primaries[index % Colors.primaries.length],
      ),
      title: Text(
        'Item $index',
        key: Key('favorites_text_$index'),
      ),
      trailing: IconButton(
        key: Key('remove_icon_$index'),
        icon: const Icon(Icons.close),
        onPressed: () {
          Provider.of<Favorites>(context, listen: false).remove(index);
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('Removed from favorites.'),
              duration: Duration(seconds: 1),
            ),
          );
        },
      ),
    );
  }
}
