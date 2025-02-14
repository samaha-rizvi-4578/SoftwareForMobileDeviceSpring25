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
      home: const ResponsiveViewPage(),
    );
  }
}

class ResponsiveViewPage extends StatelessWidget {
  const ResponsiveViewPage({super.key});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return screenWidth > screenHeight ? LandscapeWidget() : PortraitWidget();
  }
}

class NumberItem extends StatelessWidget {
  final int number;
  const NumberItem({required this.number, super.key});

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      backgroundColor: Colors.blue,
      child: Text(
        number.toString(),
        style: const TextStyle(color: Colors.black, fontWeight: FontWeight.w900),
      ),
    );
  }
}

class LandscapeWidget extends StatelessWidget {
  LandscapeWidget({super.key});

  final List<int> list1 = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10];
  final List<int> list2 = [11, 12, 13, 14, 15, 16, 17, 18, 19, 20];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Landscape View')),
      body: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: _buildList(list1),
            ),
          ),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: _buildList(list2),
            ),
          ),
        ],
      ),
    );
  }

  List<Widget> _buildList(List<int> list) {
    return list.map((item) => NumberItem(number: item)).toList();
  }
}

class PortraitWidget extends StatelessWidget {
  PortraitWidget({super.key});

  final List<int> list = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Portrait View')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: _buildList(),
        ),
      ),
    );
  }

  List<Widget> _buildList() {
    return list.map((item) => NumberItem(number: item)).toList();
  }
}
