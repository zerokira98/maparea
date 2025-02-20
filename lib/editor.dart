import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';

class Editor extends StatefulWidget {
  const Editor({super.key});

  @override
  State<Editor> createState() => _EditorState();
}

class _EditorState extends State<Editor> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: FlutterMap(options: MapOptions(), children: []),
    );
  }
}
