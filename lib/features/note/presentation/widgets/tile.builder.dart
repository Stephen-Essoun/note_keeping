import 'package:flutter/material.dart';
import 'package:note/features/note/presentation/provider/note.provider.dart';
import 'package:note/features/note/presentation/views/create.note.dart';
import 'package:provider/provider.dart';

import '../../domain/entities/note.dart';

class TileBuilder extends StatelessWidget {
  const TileBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<List<Note>>(
      stream: context.read<NoteProvider>().get(context),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          var note = snapshot.data!;
          return ListView.builder(
              itemCount: note.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => CreateNoteView(
                          note: note[index],
                        ),
                      ),
                    );
                  },
                  child: Card(
                    elevation: 1,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: SizedBox(
                        height: MediaQuery.of(context).size.height * .08,
                        width: MediaQuery.of(context).size.width,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Text(DateTime.now().toString()),
                            Text(
                              note[index].title,
                              style: const TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.w500),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                );
              });
        } else if (snapshot.hasError) {
          return const Center(
            child: Text('No data found'),
          );
        }
        return const Center(child: CircularProgressIndicator.adaptive());
      },
    );
  }
}
