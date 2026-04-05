import 'package:flutter/material.dart';
import 'package:notes_app/state/home_state.dart';

void main() {
  runApp(const MaterialApp(home: Home(),));
}

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => HomeState();
}
