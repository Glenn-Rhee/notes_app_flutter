import 'package:flutter/material.dart';

class _AddNoteState extends State<AddNote> {
  final TextEditingController titleController = TextEditingController();
  final TextEditingController contentController = TextEditingController();

  @override
  void dispose() {
    titleController.dispose();
    contentController.dispose();
    super.dispose();
  }

  void _handleSave() {
    if (titleController.text.trim() == "" ||
        contentController.text.trim() == "") {
      _handleError();
      return;
    }
    var title = titleController.text;
  }

  void _handleError() {
    showDialog(
      context: context,
      builder: (dialogCtx) {
        Future.delayed(const Duration(seconds: 1), () {
          // ignore: use_build_context_synchronously
          Navigator.of(dialogCtx).pop();
        });
        return Align(
          alignment: Alignment.topCenter,
          child: Padding(
            padding: const EdgeInsets.only(top: 20),
            child: Material(
              borderRadius: BorderRadius.circular(14),
              child: Container(
                width: 300,
                padding: const EdgeInsets.all(16),
                child: Text(
                  "Title and content cannot be empty!",
                  style: TextStyle(fontSize: 14, fontWeight: FontWeight(500)),
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        actionsPadding: const EdgeInsets.all(16),
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back, size: 22.0, color: Colors.white),
        ),
        title: const Text(
          "Tambah Note",
          style: TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight(600),
          ),
        ),
        backgroundColor: Colors.transparent,
        actions: [
          IconButton(
            onPressed: _handleSave,
            icon: const Icon(Icons.save, color: Colors.green),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Title
            TextField(
              controller: titleController,
              style: const TextStyle(color: Colors.white, fontSize: 18),
              decoration: InputDecoration(
                hintText: "Title",
                hintStyle: const TextStyle(color: Colors.white70),
                filled: false,
                contentPadding: const EdgeInsets.symmetric(
                  horizontal: 1.2,
                  vertical: 6.0,
                ),
                enabledBorder: const UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.grey, width: 0.7),
                ),
                focusedBorder: const UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.white),
                ),
              ),
            ),
            const SizedBox(height: 12),
            // content
            Expanded(
              child: TextField(
                controller: contentController,
                style: const TextStyle(color: Colors.white, fontSize: 16),
                maxLines: null,
                expands: true,
                textAlignVertical: TextAlignVertical.top,
                decoration: InputDecoration(
                  hintText: "Note something down",
                  hintStyle: const TextStyle(color: Colors.white70),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class AddNote extends StatefulWidget {
  const AddNote({super.key});

  @override
  State<AddNote> createState() => _AddNoteState();
}
