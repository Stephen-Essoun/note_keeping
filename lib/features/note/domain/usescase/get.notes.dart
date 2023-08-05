import 'package:dartz/dartz.dart';
import 'package:flutter/foundation.dart';
import 'package:note/features/note/data/repositories/note.repository.impl.dart';
import 'package:note/features/note/domain/repositories/note.repository.dart';
import 'package:note/shared/errors/failure.dart';
import 'package:note/shared/utils/usecase.dart';

import '../entities/note.dart';

class GetNotes extends ChangeNotifier
    implements UseCase<Stream<List<Note>>, Params<void>> {
  final NoteRepository repo;

  GetNotes(this.repo);
  GetNotes.empty() : repo = NoteRepositoryImpl.empty();

  @override
  Future<Either<Failure, Stream<List<Note>>>> call(Params params) {
    return repo.getNotes();
  }
}
