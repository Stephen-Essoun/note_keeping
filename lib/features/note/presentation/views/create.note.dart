import 'package:flutter/material.dart';

class CreateNoteView extends StatelessWidget {
  const CreateNoteView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('New note'),
      ),
      body: const Padding(
        padding: EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 10,
            ),
            Text('Date and Time'),
            TextField(
              decoration: InputDecoration(
                hintText: 'Title',
                hintStyle: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
                border: InputBorder.none,
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Expanded(
              // height: MediaQuery.of(context).size.height,
              child: TextField(
                decoration: InputDecoration(
                  hintText: 'search note',
                  border: InputBorder.none,
                ),
                expands: true,
                minLines: null,
                maxLines: null,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
