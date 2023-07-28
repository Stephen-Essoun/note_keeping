import 'package:flutter/material.dart';

PreferredSize widget(BuildContext context) {
  return PreferredSize(
    preferredSize: const Size.square(70),
    child: SizedBox(
      height: MediaQuery.of(context).size.width * 0.13,
      width: MediaQuery.of(context).size.width / 1.05,
      child: const Card(
        child: TextField(
          decoration: InputDecoration(
            hintText: 'search note',
            prefixIcon: Icon(Icons.search),
            border: InputBorder.none,
            isDense: true,
          ),
        ),
      ),
    ),
  );
}
