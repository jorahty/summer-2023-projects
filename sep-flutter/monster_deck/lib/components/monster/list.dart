import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../data/monster.dart';
import '../../model/model.dart';
import 'card.dart';

class MonsterList extends StatelessWidget {
  const MonsterList({
    super.key,
    required this.monsters,
  });

  final List<Monster> monsters;

  @override
  Widget build(BuildContext context) {
    var model = context.watch<ViewModel>();

    return ListView.builder(
      itemCount: monsters.length,
      itemBuilder: (context, index) {
        var monster = monsters[index];

        var trailing = IconButton(
          icon: Icon(
            model.saved.contains(monster)
                ? Icons.turned_in
                : Icons.turned_in_not,
          ),
          onPressed: () {
            model.toggleSaved(monster);
          },
        );

        return Padding(
          padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
          child: MonsterCard(monster: monster, trailing: trailing),
        );
      },
    );
  }
}
