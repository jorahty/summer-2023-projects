import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../components/monster/list.dart';
import '../model/model.dart';

class SavedPage extends StatelessWidget {
  const SavedPage({super.key});

  @override
  Widget build(BuildContext context) {
    var saved = context.watch<ViewModel>().saved;

    return MonsterList(monsters: saved);
  }
}
