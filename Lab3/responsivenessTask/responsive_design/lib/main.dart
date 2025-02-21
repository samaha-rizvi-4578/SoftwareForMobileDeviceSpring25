import 'package:flutter/material.dart';
import 'portrait_view.dart';
import 'landscape_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'TODO LIST',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const ToDoHomePage(),
    );
  }
}

class ToDoHomePage extends StatelessWidget {
  const ToDoHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    bool isPortrait = MediaQuery.of(context).orientation == Orientation.portrait;
    
    return Scaffold(
      appBar: AppBar(
        title: const Text('To Do'),
      ),
      body: isPortrait ? const PortraitView() : const LandscapeView(),
    );
  }
}
