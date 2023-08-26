import 'package:dartz/dartz.dart';
import 'package:flutter/foundation.dart';
import 'package:note/features/note/data/repositories/note.repository.impl.dart';
import 'package:note/features/note/domain/repositories/note.repository.dart';
import 'package:note/shared/errors/failure.dart';
import 'package:note/shared/utils/usecase.dart';

import '../entities/note.dart';

class AddNote extends ChangeNotifier implements UseCase<Note, Params<Note>> {
  final NoteRepository repo;

  AddNote(this.repo);
  AddNote.empty() : repo = NoteRepositoryImpl.empty();
  @override
  Future<Either<Failure, Note>> call(Params<Note> params) async {
    return await repo.add(params.data);
  }
}
