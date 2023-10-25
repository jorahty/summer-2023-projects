import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../model/model.dart';
import '../components/monster/list.dart';
import '../components/monster/input.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    var monsters = context.watch<ViewModel>().monsters;

    return Column(
      children: [
        Expanded(child: MonsterList(monsters: monsters)),
        Container(
          padding: const EdgeInsets.all(20),
          child: const MonsterInput(),
        ),
      ],
    );
  }
}
