import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../data/monster.dart';
import '../../model/model.dart';
import '../../pages/monster.dart';

class MonsterCard extends StatelessWidget {
  const MonsterCard({
    super.key,
    required this.monster,
    required this.trailing,
  });

  final Monster monster;
  final Widget trailing;

  @override
  Widget build(BuildContext context) {
    var model = context.watch<ViewModel>();

    return Card(
      elevation: 3,
      child: ListTile(
        onTap: () {
          model.selectMonster(monster);
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const MonsterPage(),
            ),
          );
        },
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        contentPadding:
            const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        leading: Image.network(monster.imageUrl),
        title: Text(monster.name),
        subtitle: Text(monster.planet),
        trailing: trailing,
      ),
    );
  }
}
