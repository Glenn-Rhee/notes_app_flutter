import 'package:flutter/material.dart';
import 'package:notes_app/notes.dart';
import 'package:notes_app/page/add_note.dart';

void main() {
  List<Note> notes = Notes().getNotes() ?? [];
  runApp(MyApp(notes: notes));
}

class MyApp extends StatelessWidget {
  final List<Note> notes;
  const MyApp({super.key, required this.notes});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: const Color.fromARGB(255, 25, 25, 25),
        appBar: AppBar(
          title: const Text("Notes App", style: TextStyle(color: Colors.white)),
          actions: [
            IconButton(
              icon: const Icon(Icons.search, color: Colors.white),
              onPressed: () => {},
            ),
            IconButton(
              icon: const Icon(Icons.info, color: Colors.white),
              onPressed: () => {},
            ),
          ],
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
        body: ListView(
          padding: const EdgeInsets.all(16),
          children: notes.map((note) {
            return Card(
              color: const Color(0xFF91F48F),
              child: Container(
                width: double.infinity,
                padding: const EdgeInsets.all(8),
                child: IntrinsicHeight(
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Expanded(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            // Atas
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [Text(note.title), Text(note.content)],
                            ),
                            // Bawah
                            Text(note.createdAt.toLocal().month.toString()),
                          ],
                        ),
                      ),
                      Column(
                        children: [
                          IconButton(
                            onPressed: () => {},
                            icon: Icon(
                              Icons.edit,
                              size: 18,
                              color: Colors.blue.shade800,
                            ),
                          ),
                          IconButton(
                            onPressed: () => {},
                            icon: Icon(
                              Icons.delete,
                              size: 18,
                              color: Colors.red.shade600,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            );
          }).toList(),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () => {
            Navigator.of(context).push(
              PageRouteBuilder(
                pageBuilder: (context, animation, secondaryAnimation) =>
                    const AddNote(),
              ),
            ),
          },
          child: Icon(Icons.add),
        ),
      ),
    );
  }
}
