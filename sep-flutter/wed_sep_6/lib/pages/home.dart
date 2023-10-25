import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      padding: const EdgeInsets.all(20),
      itemCount: 100,
      separatorBuilder: (context, index) => const SizedBox(height: 20),
      itemBuilder: (context, index) {
        return Card(
          clipBehavior: Clip.antiAlias,
          child: ListTile(
            contentPadding: const EdgeInsets.all(20),
            onTap: () {},
            title: Text('Item $index'),
            subtitle: Text('Item $index'),
            trailing: IconButton(
              icon: const Icon(Icons.turned_in_not),
              onPressed: () {},
            ),
          ),
        );
      },
    );
  }
}
