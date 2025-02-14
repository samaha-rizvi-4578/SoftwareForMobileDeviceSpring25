import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const TodoHomePage(),
    );
  }
}

class TodoHomePage extends StatelessWidget {
  const TodoHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Todo List"),
      ),
      body: Column(
        children: [
          CustomListItem(todoText: "Task 1"),
          CustomListItem(todoText: "Task 2"),
          CustomListItem(todoText: "Task 3"),
          CustomListItem(todoText: "Task 4"),
          ElevatedButton(onPressed: () {}, child: const Text("Press me")),
        ],
      ),
    );
  }
}

class CustomListItem extends StatefulWidget {
  const CustomListItem({super.key, required this.todoText});

  final String todoText;

  @override
  _CustomListItemState createState() => _CustomListItemState();
}

class _CustomListItemState extends State<CustomListItem> {
  bool isDone = false;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () {
        setState(() {
          isDone = !isDone;
        });
      },
      title: Text(widget.todoText),
      trailing: Checkbox(
        value: isDone,
        onChanged: (bool? newValue) {
          setState(() {
            isDone = newValue ?? false;
          });
        },
      ),
    );
  }
}
