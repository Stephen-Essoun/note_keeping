import 'package:flutter/material.dart';
import 'package:note/features/note/presentation/views/create.note.dart';
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
      body: const Padding(
        padding: EdgeInsets.only(
          top: 10,
          left: 10,
          right: 10,
        ),
        child: TileBuilder(),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => const CreateNoteView(),
          ));
        },
        child: const Icon(Icons.note_add),
      ),
    );
  }
}
