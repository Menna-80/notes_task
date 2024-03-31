import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task2/note_batch.dart';
import 'package:task2/note_cubit.dart';
import 'package:task2/note_model.dart';

class NoteView extends StatelessWidget {
   NoteView({Key? key}) : super(key: key);

  final NoteCubit noteCubit = NoteCubit();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Note'),
      ),
      body: BlocBuilder<NoteCubit, List<Note>>(
        bloc: noteCubit,
        builder: (context, notes) {
          return ListView.builder(
            itemCount: (notes.length / 5).ceil(),
            itemBuilder: (context, index) {
              final startIndex = index * 5;
              final endIndex = startIndex + 5;
              final batch = notes.sublist(startIndex, endIndex > notes.length ? notes.length : endIndex);
              return GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => NoteBatchScreen(notes: batch),
                    ),
                  );
                },
                child: Card(
                  child: ListTile(
                    title: Text('Notes ${index + 1} - ${index + batch.length}'),
                    subtitle: Text('Tap to view'),
                  ),
                ),
              );
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _addNote(context);
        },
        child: const Icon(Icons.add),
      ),
    );
  }

  void _addNote(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        String title = '';
        String content = '';

        return AlertDialog(
          title: const Text('Add Note'),
          content: Column(
            children: [
              TextField(
                decoration: const InputDecoration(
                  labelText: 'Title',
                ),
                onChanged: (value) {
                  title = value;
                },
              ),
              TextField(
                decoration: const InputDecoration(
                  labelText: 'Content',
                ),
                onChanged: (value) {
                  content = value;
                },
              ),
            ],
          ),
          actions: [
            MaterialButton(
              onPressed: () {
                Note note = Note(
                  title: title,
                  content: content,
                );
                noteCubit.AddNote(note);
                Navigator.of(context).pop();
              },
              child: const Text('Add'),
            ),
          ],
        );
      },
    );
  }
}
