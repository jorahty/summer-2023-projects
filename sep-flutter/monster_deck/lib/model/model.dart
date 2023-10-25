import 'package:flutter/widgets.dart';

import '../data/monster.dart';

class ViewModel extends ChangeNotifier {
  final List<Monster> _monsters = [
    Monster(
      name: 'Fuzzywump',
      imageUrl: 'https://cdn-icons-png.flaticon.com/256/8359/8359988.png',
      planet: 'Flufforia',
      age: 3,
      height: 1,
      weight: 5,
    ),
    Monster(
      name: 'Gigglesnort',
      imageUrl: 'https://cdn-icons-png.flaticon.com/256/8359/8359992.png',
      planet: 'Chuckleville',
      age: 2.5,
      height: 0.8,
      weight: 3,
    ),
    Monster(
      name: 'Snugglebeast',
      imageUrl: 'https://cdn-icons-png.flaticon.com/256/8359/8359996.png',
      planet: 'Cuddleton',
      age: 4,
      height: 1.2,
      weight: 8,
    ),
    Monster(
      name: 'Bumbleboop',
      imageUrl: 'https://cdn-icons-png.flaticon.com/256/8360/8360000.png',
      planet: 'Bumbleland',
      age: 1,
      height: 0.5,
      weight: 2,
    ),
    Monster(
      name: 'Cuddleclaw',
      imageUrl: 'https://cdn-icons-png.flaticon.com/256/8360/8360004.png',
      planet: 'Hugsville',
      age: 5,
      height: 1.5,
      weight: 10,
    ),
    Monster(
      name: 'Sparklepaws',
      imageUrl: 'https://cdn-icons-png.flaticon.com/256/8360/8360007.png',
      planet: 'Sparkland',
      age: 2,
      height: 1.1,
      weight: 6,
    ),
    Monster(
      name: 'Jumblewhisk',
      imageUrl: 'https://cdn-icons-png.flaticon.com/256/8360/8360014.png',
      planet: 'Whiskerworld',
      age: 3.5,
      height: 1.3,
      weight: 7,
    ),
    Monster(
      name: 'Twinkletooth',
      imageUrl: 'https://cdn-icons-png.flaticon.com/256/8360/8360019.png',
      planet: 'Starshine',
      age: 4,
      height: 1.4,
      weight: 9,
    ),
    Monster(
      name: 'Rainbowrumble',
      imageUrl: 'https://cdn-icons-png.flaticon.com/256/8360/8360024.png',
      planet: 'Prismar',
      age: 6,
      height: 1.6,
      weight: 12,
    ),
    Monster(
      name: 'Marshmallowmunch',
      imageUrl: 'https://cdn-icons-png.flaticon.com/256/8360/8360028.png',
      planet: 'Sweetmarsh',
      age: 1.5,
      height: 0.7,
      weight: 4,
    ),
    Monster(
      name: 'Starrygobble',
      imageUrl: 'https://cdn-icons-png.flaticon.com/256/8360/8360032.png',
      planet: 'Celestia',
      age: 5,
      height: 1.3,
      weight: 8,
    ),
    Monster(
      name: 'Bubblebounce',
      imageUrl: 'https://cdn-icons-png.flaticon.com/256/8360/8360036.png',
      planet: 'Bubbleland',
      age: 2,
      height: 1.1,
      weight: 6,
    ),
    Monster(
      name: 'Fluffernoodle',
      imageUrl: 'https://cdn-icons-png.flaticon.com/256/8360/8360040.png',
      planet: 'Noodleopolis',
      age: 3,
      height: 1.2,
      weight: 7,
    ),
    Monster(
      name: 'Squeakleflame',
      imageUrl: 'https://cdn-icons-png.flaticon.com/256/8360/8360043.png',
      planet: 'Flametopia',
      age: 4,
      height: 1.4,
      weight: 9,
    ),
    Monster(
      name: 'Doodlewhiff',
      imageUrl: 'https://cdn-icons-png.flaticon.com/256/8360/8360046.png',
      planet: 'Sketchville',
      age: 2.5,
      height: 1.1,
      weight: 5,
    ),
    Monster(
      name: 'Glimmergobble',
      imageUrl: 'https://cdn-icons-png.flaticon.com/256/8360/8360049.png',
      planet: 'Sparklea',
      age: 3,
      height: 1.3,
      weight: 8,
    ),
    Monster(
      name: 'Wobblewhisk',
      imageUrl: 'https://cdn-icons-png.flaticon.com/256/8360/8360052.png',
      planet: 'Whiskerwood',
      age: 5.5,
      height: 1.5,
      weight: 10,
    ),
    Monster(
      name: 'Hugglehuff',
      imageUrl: 'https://cdn-icons-png.flaticon.com/256/8360/8360055.png',
      planet: 'Snugglehaven',
      age: 4,
      height: 1.4,
      weight: 9,
    ),
    Monster(
      name: 'Fuzzysparks',
      imageUrl: 'https://cdn-icons-png.flaticon.com/256/8360/8360058.png',
      planet: 'Sparkleton',
      age: 2,
      height: 1.2,
      weight: 7,
    ),
    Monster(
      name: 'Bubblybop',
      imageUrl: 'https://cdn-icons-png.flaticon.com/256/8360/8360061.png',
      planet: 'Bubbleville',
      age: 1.5,
      height: 0.6,
      weight: 3,
    ),
    Monster(
      name: 'Snickerfuzz',
      imageUrl: 'https://cdn-icons-png.flaticon.com/256/8360/8360063.png',
      planet: 'Chucklevale',
      age: 3,
      height: 1.3,
      weight: 8,
    ),
    Monster(
      name: 'Gobbleglow',
      imageUrl: 'https://cdn-icons-png.flaticon.com/256/8360/8360066.png',
      planet: 'Gobbletopia',
      age: 4.5,
      height: 1.4,
      weight: 9,
    ),
    Monster(
      name: 'Wigglesniff',
      imageUrl: 'https://cdn-icons-png.flaticon.com/256/8360/8360069.png',
      planet: 'Wiggleland',
      age: 2,
      height: 1.1,
      weight: 6,
    ),
    Monster(
      name: 'Cuddlepuff',
      imageUrl: 'https://cdn-icons-png.flaticon.com/256/8360/8360072.png',
      planet: 'Cuddlehaven',
      age: 3,
      height: 1.2,
      weight: 7,
    ),
    Monster(
      name: 'Dazzlewhisk',
      imageUrl: 'https://cdn-icons-png.flaticon.com/256/8360/8360075.png',
      planet: 'Sparklantis',
      age: 5,
      height: 1.4,
      weight: 8,
    ),
  ];

  final List<Monster> _saved = [];

  Monster? _selectedMonster;

  List<Monster> get monsters => _monsters;
  List<Monster> get saved => _saved;
  Monster? get selectedMonster => _selectedMonster;

  void toggleSaved(Monster monster) {
    if (_saved.contains(monster)) {
      _saved.remove(monster);
    } else {
      _saved.add(monster);
    }
    notifyListeners();
  }

  void selectMonster(Monster monster) {
    _selectedMonster = monster;
  }
}
