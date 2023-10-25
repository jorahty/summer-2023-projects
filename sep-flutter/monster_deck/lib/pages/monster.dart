import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../components/monster/details.dart';
import '../model/model.dart';

class MonsterPage extends StatelessWidget {
  const MonsterPage({super.key});

  @override
  Widget build(BuildContext context) {
    var monster = context.watch<ViewModel>().selectedMonster!;

    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: MonsterDetails(monster: monster),
      ),
    );
  }
}
