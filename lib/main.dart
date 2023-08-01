
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:note/features/authentication/presentation/views/auth.view.dart';

// import 'features/note/presentation/views/home.view.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:note/features/note/domain/entities/note.dart';
import 'package:note/firebase_options.dart';
import 'package:path_provider/path_provider.dart';
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
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
    return MaterialApp(
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.red),
        useMaterial3: true,
      ),
      home: const AuthView(),
    );
  }
}
