import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'To-Do List',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // TRY THIS: Try running your application with "flutter run". You'll see
        // the application has a purple toolbar. Then, without quitting the app,
        // try changing the seedColor in the colorScheme below to Colors.green
        // and then invoke "hot reload" (save your changes or press the "hot
        // reload" button in a Flutter-supported IDE, or press "r" if you used
        // the command line to start the app).
        //
        // Notice that the counter didn't reset back to zero; the application
        // state is not lost during the reload. To reset the state, use hot
        // restart instead.
        //
        // This works for code too, not just values: Most code changes can be
        // tested with just a hot reload.
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'To-DO List HomePage'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  // void _incrementCounter() {
  //   setState(() {
  //     // This call to setState tells the Flutter framework that something has
  //     // changed in this State, which causes it to rerun the build method below
  //     // so that the display can reflect the updated values. If we changed
  //     // _counter without calling setState(), then the build method would not be
  //     // called again, and so nothing would appear to happen.
  //     _counter++;
  //   });
  // }

  // Hardcoded list of tasks
  List<Map<String, dynamic>> tasks = [
    {"title": "Complete Flutter Setup", "isCompleted": true},
    {"title": "Read documentation", "isCompleted": false},
    {"title": "Make Project Proposal", "isCompleted": false},
    {"title": "Create To Do list App", "isCompleted": false},
  ];

  // task completion toggle
  void toggleTask(int index) {
    setState(() {
      tasks[index]["isCompleted"] = !tasks[index]["isCompleted"];
    });
  }

  // delete a task
  void deleteTask(int index) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text('Are you sure you want to delete this task?'),
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

  // add a task
  void addTask() {
    setState(() {
      // take input from user to add new task
      var title = 'new task $_counter';
      tasks.add({"title": title, "isCompleted": false});
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        // TRY THIS: Try changing the color here to a specific color (to
        // Colors.amber, perhaps?) and trigger a hot reload to see the AppBar
        // change color while the other colors stay the same.
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: ListView.builder(
        itemCount: tasks.length,
        itemBuilder: (context, index) {
          return Card(
            margin: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
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
              trailing: IconButton(
                  icon: Icon(Icons.delete, color: Colors.red),
                  onPressed: () => deleteTask(
                        index,
                      )),
            ),
          );
        },
      ),
      // floating action button
      floatingActionButton: FloatingActionButton(
        onPressed: () => addTask(),
        child: const Icon(Icons.add),
      ),
    );
  }
}
