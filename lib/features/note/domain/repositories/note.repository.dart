import 'package:dartz/dartz.dart';
import 'package:flutter/foundation.dart';

import '../../../../shared/errors/failure.dart';
import '../entities/note.dart';

abstract class NoteRepository extends ChangeNotifier {
  Future<Either<Failure, Note>> add(Note note);
  Future<Either<Failure, Note>> update(Note note);
  Future<Either<Failure, Note>> delete(Note note);
  Future<Either<Failure, Stream<List<Note>>>> getNotes();
}
