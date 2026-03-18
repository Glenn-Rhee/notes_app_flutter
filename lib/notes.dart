class Note {
  String id;
  String title;
  String content;
  DateTime createdAt;

  Note({
    required this.title,
    required this.content,
    required this.id,
    required this.createdAt,
  });
}

class Notes {
  List<Note>? getNotes() {
    return [
      Note(
        id: "1",
        title: "Belajar Flutter",
        content: "Hari ini belajar ListView",
        createdAt: DateTime.now(),
      ),
      Note(
        id: "2",
        title: "Project",
        content: "Bikin Notes App",
        createdAt: DateTime.now(),
      ),
      Note(
        id: "3",
        title: "Project 1",
        content: "Bikin Notes App 1",
        createdAt: DateTime.now(),
      ),
    ];
  }
}
