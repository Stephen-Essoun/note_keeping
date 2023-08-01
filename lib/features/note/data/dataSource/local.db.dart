import 'package:hive_flutter/hive_flutter.dart';

import '../../domain/entities/note.dart';

abstract class LocalDB {
  Future<Note> addNote(Note note);
  Future<Note> editNote(Note note);
  Future<Note> deleteNote(Note note);
  Future<List<Note>> allNote();
}

class LocalDBImpl implements LocalDB {
  final db = Hive.box('notes');
  @override
  Future<Note> addNote(Note note) async {
   await db.put(note.id, note.toMap());
   return note;
  }

  @override
  Future<Note> deleteNote(Note note) async {
    await db.delete(note.id,);
   return note;
  }

  @override
  Future<Note> editNote(Note note) async {
    await db.put(note.id, note.toMap());
   return note;
  }

  @override
  Future<List<Note>> allNote() async {
    final notes = await db.get('notes');
    return notes;
  }
}
