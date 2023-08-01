import 'package:cloud_firestore/cloud_firestore.dart';

import '../../domain/entities/note.dart';

abstract class RemoteDB {
  Future<Note> addNote(Note note);
  Future<Note> editNote(Note note);
  Future<Note> deleteNote(Note note);
  Future<List<Note>> allNote();
}

class RemoteDBImpl implements RemoteDB{
  final db = FirebaseFirestore.instance.doc('user').collection('');
  @override
  Future<Note> addNote(Note note) {
    // TODO: implement addNote
    throw UnimplementedError();
  }

  @override
  Future<List<Note>> allNote() {
    // TODO: implement allNote
    throw UnimplementedError();
  }

  @override
  Future<Note> deleteNote(Note note) {
    // TODO: implement deleteNote
    throw UnimplementedError();
  }

  @override
  Future<Note> editNote(Note note) {
    // TODO: implement editNote
    throw UnimplementedError();
  }
}