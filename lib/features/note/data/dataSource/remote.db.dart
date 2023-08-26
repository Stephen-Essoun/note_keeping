import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:note/features/note/domain/entities/note.dart';

abstract class RemoteDB {
  Future<Note> add(Note note);
  Stream<List<Note>> getNotes();
  Future<Note> update(Note note);
  Future<Note> delete(Note note);
}

class RemoteDBImpl extends ChangeNotifier implements RemoteDB {
  RemoteDBImpl();
  final db = FirebaseFirestore.instance.collection('note');
  // .doc(FirebaseAuth.instance.currentUser!.email)
  // .collection('notes');
  get rdb => db;
  @override
  Future<Note> add(Note note) async {
    await db.doc(note.id.toString()).set(note.toMap());
    return note;
  }

  @override
  Stream<List<Note>> getNotes() async* {
    yield* db.snapshots().map(
          (snapshot) => snapshot.docs.map(
            (docs) {
              return Note.fromMap(
                docs.data(),
              );
            },
          ).toList(),
        );
  }

  @override
  Future<Note> update(Note note) async {
    await db.doc(note.id.toString()).update(note.toMap());
    return note;
  }

  @override
  Future<Note> delete(Note note) async {
    await db.doc(note.id.toString()).delete();
    return note;
  }
}
