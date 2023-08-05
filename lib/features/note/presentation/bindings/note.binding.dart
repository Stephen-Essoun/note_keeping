import 'package:note/features/note/data/dataSource/remote.db.dart';
import 'package:note/features/note/data/repositories/note.repository.impl.dart';
import 'package:note/features/note/domain/repositories/note.repository.dart';
import 'package:note/features/note/domain/usescase/add.dart';
import 'package:note/features/note/domain/usescase/delete.dart';
import 'package:note/features/note/domain/usescase/get.notes.dart';
import 'package:note/features/note/domain/usescase/update.dart';
import 'package:note/features/note/presentation/provider/note.provider.dart';
import 'package:provider/provider.dart';

class NoteBinding {
  final remoteDB = ChangeNotifierProvider<RemoteDBImpl>(create: (context) => RemoteDBImpl());

  final noteRep = ChangeNotifierProxyProvider<RemoteDBImpl, NoteRepository>(
    create: (context) => NoteRepositoryImpl.empty(),
    update: (context, value, previous) => NoteRepositoryImpl(value),
  );

  final add = ChangeNotifierProxyProvider<NoteRepository, AddNote>(
    create: (context) => AddNote.empty(),
    update: (context, value, previous) => AddNote(value),
  );

  final get = ChangeNotifierProxyProvider<NoteRepository, GetNotes>(
    create: (context) => GetNotes.empty(),
    update: (context, value, previous) => GetNotes(value),
  );

  final update = ChangeNotifierProxyProvider<NoteRepository, UpdateNote>(
    create: (context) => UpdateNote.empty(),
    update: (context, value, previous) => UpdateNote(value),
  );

  final delete = ChangeNotifierProxyProvider<NoteRepository, DeleteNote>(
    create: (context) => DeleteNote.empty(),
    update: (context, value, previous) => DeleteNote(value),
  );

  final noteProvider = ChangeNotifierProxyProvider<AddNote, NoteProvider>(
    create: (context) => NoteProvider.empty(),
    update: (context, addNote, previous) => NoteProvider(
        addNote,
        context.read<GetNotes>(),
        context.read<UpdateNote>(),
        context.read<DeleteNote>()),
  );
}
