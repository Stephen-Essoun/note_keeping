import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:note/features/note/domain/usescase/add.dart';
import 'package:note/features/note/domain/usescase/delete.dart';
import 'package:note/features/note/domain/usescase/get.notes.dart';
import 'package:note/features/note/domain/usescase/update.dart';
import 'package:note/shared/utils/usecase.dart';

import '../../domain/entities/note.dart';

class NoteProvider extends ChangeNotifier {
  final AddNote addNote;
  final GetNotes getNotes;
  final UpdateNote updateNote;
  final DeleteNote deleteNote;

  NoteProvider(this.addNote, this.getNotes, this.updateNote, this.deleteNote);
  NoteProvider.empty()
      : addNote = AddNote.empty(),
        getNotes = GetNotes.empty(),
        updateNote = UpdateNote.empty(),
        deleteNote = DeleteNote.empty();

  Future<void> add(Note note, context) async {
    final result = await addNote.call(Params(note));
    result.fold(
      (l) => ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text("Couln't create note"),
      )),
      (r) {
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text('Note created successfully'),
        ));
        return r;
      },
    );
  }

  Stream<List<Note>> get(context) async* {
    final result = await getNotes.call(Params(NoParams));
    yield* result.fold((l) {
      print(l.message);
      return Stream.value([]);
    }, (r) => r);
  }

  Future<void> update(Note note, context) async {
    final result = await updateNote.call(Params(note));
    result.fold(
      (l) => ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text("Couln't update note"),
      )),
      (r) {
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text('Note updated successfully'),
        ));
        return r;
      },
    );
  }

  Future<void> delete(Note note, context) async {
    final result = await deleteNote.call(Params(note));
    result.fold(
      (l) => ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text("Couln't delete note"),
      )),
      (r) {
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text('Note deleted successfully'),
        ));
        return r;
      },
    );
  }
}
