import 'package:flutter/material.dart';
import 'package:note/features/note/presentation/views/create.note.dart';
import 'package:note/features/note/presentation/views/home.view.dart';
import 'package:note/features/userProfile/presentation/views/user.profile.dart';

class MainView extends StatefulWidget {
  const MainView({super.key});

  @override
  State<MainView> createState() => _MainViewState();
}

class _MainViewState extends State<MainView> {
  int _currentIndex = 0;

  final pages = <Widget>[
    const HomeView(),
    const HomeView(),
    const UserProfileView(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: _currentIndex,
        children: pages,
      ),
      bottomNavigationBar: BottomAppBar(
        shape: const CircularNotchedRectangle(),
        // color: Colors.red[200],
        elevation: 10,
        notchMargin: 10.0,
        clipBehavior: Clip.antiAlias,
        child: Row(children: [
          IconButton(
            onPressed: () {
              setState(() {
                _currentIndex = 0;
              });
            },
            icon: Icon(
              Icons.home,
              size: _currentIndex == 0 ? 40 : 35,
            ),
          ),
          const SizedBox(
            width: 50,
          ),
          IconButton(
            onPressed: () {
              setState(() {
                _currentIndex = 1;
              });
            },
            icon: Icon(
              Icons.settings,
              size: _currentIndex == 1 ? 40 : 35,
            ),
          ),
          const SizedBox(
            width: 50,
          ),
          IconButton(
            onPressed: () {
              setState(() {
                _currentIndex = 2;
              });
            },
            icon: Icon(
              Icons.person,
              size: _currentIndex == 2 ? 40 : 35,
            ),
          )
        ]),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
      floatingActionButton: FloatingActionButton(
        elevation: 2,
        child: const Icon(Icons.add),
        onPressed: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => const CreateNoteView(),
            ),
          );
        },
      ),
    );
  }
}
