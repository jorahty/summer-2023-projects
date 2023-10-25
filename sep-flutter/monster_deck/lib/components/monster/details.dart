import 'package:flutter/material.dart';

import '../../data/monster.dart';

class MonsterDetails extends StatelessWidget {
  const MonsterDetails({
    super.key,
    required this.monster,
  });

  final Monster monster;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Image.network(monster.imageUrl),
            const SizedBox(height: 20),
            Text(
              monster.name,
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            const SizedBox(height: 20),
            Text(
              'Planet: ${monster.planet}',
              style: Theme.of(context).textTheme.headlineSmall,
            ),
            const SizedBox(height: 20),
            Text(
              'Age: ${monster.age} yr',
              style: Theme.of(context).textTheme.bodyLarge,
            ),
            const SizedBox(height: 20),
            Text(
              'Height: ${monster.height} ft',
              style: Theme.of(context).textTheme.bodyLarge,
            ),
            const SizedBox(height: 20),
            Text(
              'Weight: ${monster.height} kg',
              style: Theme.of(context).textTheme.bodyLarge,
            ),
          ],
        ),
      ),
    );
  }
}
