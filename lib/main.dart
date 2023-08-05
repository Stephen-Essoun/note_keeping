import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:note/features/authentication/presentation/views/auth.view.dart';

// import 'features/note/presentation/views/home.view.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:note/features/note/domain/entities/note.dart';
import 'package:note/features/note/presentation/bindings/note.binding.dart';
import 'package:note/features/note/presentation/views/home.view.dart';
import 'package:note/firebase_options.dart';
import 'package:path_provider/path_provider.dart';
import 'package:provider/provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  final appDocumentDir = await getApplicationDocumentsDirectory();
  Hive.init(appDocumentDir.path);
  await Hive.initFlutter();
  await Hive.openBox<Note>('notes');
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    NoteBinding noteBinding = NoteBinding();
    return MultiProvider(
      providers: [
        noteBinding.remoteDB,
        noteBinding.noteRep,
        noteBinding.add,
        noteBinding.get,
        noteBinding.update,
        noteBinding.delete,
        noteBinding.noteProvider
      ],
      child: MaterialApp(
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.red),
          useMaterial3: true,
        ),
        home: const HomeView(),
      ),
    );
  }
}
