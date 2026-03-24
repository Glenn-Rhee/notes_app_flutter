import 'package:flutter/material.dart';

class AddNote extends StatelessWidget {
  const AddNote({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.chevron_left),
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
      ),
      body: const Center(
        child: Text(
          "Silahkan tambahkan note...",
          style: TextStyle(color: Colors.white70),
        ),
      ),
    );
  }
}
