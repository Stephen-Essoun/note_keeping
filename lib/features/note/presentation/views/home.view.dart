import 'package:flutter/material.dart';
import 'package:note/features/note/presentation/widgets/tile.builder.dart';

import '../widgets/search.field.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'My Notes',
          style: TextStyle(
            fontSize: 25,
            fontWeight: FontWeight.bold,
          ),
        ),
        bottom: widget(context),
      ),
      body: Padding(
        padding: const EdgeInsets.only(
          top: 10,
          left: 10,
          right: 10,
        ),
        child: TileBuilder(key: key),
      ),
    );
  }
}
