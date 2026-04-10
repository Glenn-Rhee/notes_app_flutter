import 'package:flutter/material.dart';
import 'package:notes_app/main.dart';
import 'package:notes_app/notes.dart';
import 'package:notes_app/helper/app_navigator.dart';

class HomeState extends State<Home> {
  List<Note> notes = [];
  bool isLoading = true;
  @override
  void initState() {
    super.initState();
    fetchNotes();
  }

  Future<void> fetchNotes() async {
    try {
      final result = await Notes().getNotes();
      setState(() {
        notes = result ?? [];
        isLoading = false;
      });
    } catch (e) {
      print("Error fetching notes: $e");
      setState(() {
        isLoading = false;
        notes = [];
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Builder(
        builder: (context) {
          return Scaffold(
            backgroundColor: const Color.fromARGB(255, 25, 25, 25),
            appBar: AppBar(
              title: const Text(
                "Notes App",
                style: TextStyle(color: Colors.white),
              ),
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
                                  children: [
                                    Text(note.title),
                                    Text(note.content),
                                  ],
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
              onPressed: () => AppNavigator.goToAddNote(context),
              child: Icon(Icons.add),
            ),
          );
        },
      ),
    );
  }
}
