import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'To-Do List',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'To-Do List HomePage'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  List<Map<String, dynamic>> tasks = [
    {"title": "Complete Flutter Setup", "isCompleted": true},
    {"title": "Read documentation", "isCompleted": false},
    {"title": "Make Project Proposal", "isCompleted": false},
    {"title": "Create To-Do List App", "isCompleted": false},
  ];

  void toggleTask(int index) {
    setState(() {
      tasks[index]["isCompleted"] = !tasks[index]["isCompleted"];
    });
  }

  void deleteTask(int index) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: const Text('Are you sure you want to delete this task?'),
        action: SnackBarAction(
          label: 'Yes',
          onPressed: () {
            setState(() {
              tasks.removeAt(index);
            });
          },
        ),
      ),
    );
  }

  void editTask(int index) {
    TextEditingController taskController =
        TextEditingController(text: tasks[index]["title"]);

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text("Edit Task"),
          content: TextField(
            controller: taskController,
            decoration: const InputDecoration(labelText: "Task Title"),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context); // Close dialog
              },
              child: const Text("Cancel"),
            ),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  tasks[index]["title"] = taskController.text;
                });
                Navigator.pop(context); // Close dialog
              },
              child: const Text("Save"),
            ),
          ],
        );
      },
    );
  }

  void addTask() {
    setState(() {
      var title = 'New Task $_counter';
      tasks.add({"title": title, "isCompleted": false});
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: ListView.builder(
        itemCount: tasks.length,
        itemBuilder: (context, index) {
          return Card(
            margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
            child: ListTile(
              title: Text(
                tasks[index]["title"],
                style: TextStyle(
                  decoration: tasks[index]["isCompleted"]
                      ? TextDecoration.lineThrough
                      : TextDecoration.none,
                ),
              ),
              leading: Checkbox(
                  value: tasks[index]["isCompleted"],
                  onChanged: (value) => toggleTask(index)),
              trailing: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  IconButton(
                      icon: const Icon(Icons.edit, color: Colors.blue),
                      onPressed: () => editTask(index)),
                  IconButton(
                      icon: const Icon(Icons.delete, color: Colors.red),
                      onPressed: () => deleteTask(index)),
                ],
              ),
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: addTask,
        child: const Icon(Icons.add),
      ),
    );
  }
}
