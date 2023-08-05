import 'package:dartz/dartz.dart';
import 'package:flutter/foundation.dart';
import 'package:note/features/note/data/dataSource/remote.db.dart';
import 'package:note/features/note/domain/entities/note.dart';
import 'package:note/features/note/domain/repositories/note.repository.dart';
import 'package:note/shared/errors/failure.dart';

class NoteRepositoryImpl extends ChangeNotifier implements NoteRepository {
  final RemoteDB db;

  NoteRepositoryImpl( this.db);
NoteRepositoryImpl.empty():db = RemoteDBImpl();
  @override
  Future<Either<Failure, Note>> add(Note note) async {
    try {
      final result = await db.add(note);
      return Right(result);
    } catch (e) {
      return Left(Failure("Oops, creating was unsuccessful"));
    }
  }

  @override
  Future<Either<Failure, Note>> delete(Note note) async {
    try {
      final result = await db.delete(note);
      return Right(result);
    } catch (e) {
      return Left(Failure("Oops, deleting was unsuccessful"));
    }
  }

  @override
  Future<Either<Failure, Stream<List<Note>>>> getNotes() async {
    try {
      final result = db.getNotes();
      return Right(result);
    } catch (e) {
      return Left(Failure("Oops, could't get your notes"));
    }
  }

  @override
  Future<Either<Failure, Note>> update(Note note) async {
    try {
      final result = await db.update(note);
      return Right(result);
    } catch (e) {
      return Left(Failure("Oops, updating was unsuccessful"));
    }
  }
}
