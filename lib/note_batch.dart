import 'package:flutter/material.dart';
import 'package:task2/note_model.dart';

class NoteBatchScreen extends StatelessWidget {
  final List<Note>? notes;

  const NoteBatchScreen({Key? key, this.notes}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Notes'),
      ),
      body: ListView.builder(
        itemCount: notes!.length,
        itemBuilder: (context, index) {
          return Card(
            child: ListTile(
              title: Text(notes![index].title),
              subtitle: Text(notes![index].content),
            ),
          );
        },
      ),
    );
  }
}
