import 'dart:convert';

import 'package:http/http.dart' as http;

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

  factory Note.fromJson(Map<String, dynamic> json) {
    return Note(
      id: json['id'],
      title: json['title'],
      content: json['content'],
      createdAt: DateTime.parse(json['createdAt']),
    );
  }
}

class Notes {
  Future<List<Note>?> getNotes() async {
    final url = Uri.parse("http://10.0.2.2:8080/notes");
    final response = await http.get(url);
    if (response.statusCode == 200 || response.statusCode == 201) {
      final dataLists = jsonDecode(response.body)["data"] as List;
      return dataLists.map((data) => Note.fromJson(data)).toList();
    }

    throw Exception("Failed to load notes!");
  }
}
