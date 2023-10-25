import 'package:flutter/material.dart';

class MonsterInput extends StatelessWidget {
  const MonsterInput({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      onChanged: (value) {},
      decoration: const InputDecoration(
        labelText: 'New Monster',
        border: OutlineInputBorder(
          // Using OutlineInputBorder to create the outline border
          borderRadius: BorderRadius.all(Radius.circular(10.0)),
        ),
      ),
    );
  }
}
