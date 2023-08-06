import 'dart:math';

import 'package:flutter/material.dart';
import 'package:note/features/note/presentation/provider/note.provider.dart';
import 'package:provider/provider.dart';

import '../../domain/entities/note.dart';

class CreateNoteView extends StatefulWidget {
  const CreateNoteView({super.key, this.note});
  final Note? note;
  @override
  State<CreateNoteView> createState() => _CreateNoteViewState();
}

class _CreateNoteViewState extends State<CreateNoteView> {
  late TextEditingController titleController;
  late TextEditingController contentController;
  @override
  void initState() {
    super.initState();
    titleController = TextEditingController(text: widget.note?.title);
    contentController = TextEditingController(text: widget.note?.noteBody);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('New note'),
        actions: [
          IconButton(
            onPressed: () {
              final note = Note(
                  id: widget.note?.id ?? generateRandomId(10),
                  title: titleController.text,
                  noteBody: contentController.text);
              context.read<NoteProvider>().add(note, context);
            },
            icon: const Icon(Icons.done),
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 10,
            ),
            Text(DateTime.now().toString()),
            TextFormField(
              controller: titleController,
              decoration: const InputDecoration(
                hintText: 'Title',
                hintStyle: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
                border: InputBorder.none,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Expanded(
              child: TextFormField(
                controller: contentController,
                decoration: const InputDecoration(
                  hintText: 'note things down here',
                  border: InputBorder.none,
                ),
                expands: true,
                minLines: null,
                maxLines: null,
              ),
            ),
          ],
        ),
      ),
    );
  }

  String generateRandomId(int length) {
    final random = Random();
    const chars =
        'abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789';
    String id = '';

    for (int i = 0; i < length; i++) {
      id += chars[random.nextInt(chars.length)];
    }

    return id;
  }
}
