import 'package:flutter/material.dart';
import 'package:note/features/authentication/presentation/views/auth.view.dart';

// import 'features/note/presentation/views/home.view.dart';

void main() {
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
