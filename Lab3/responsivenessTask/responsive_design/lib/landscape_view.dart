import 'package:flutter/material.dart';
import 'number_bubble.dart';

class LandscapeView extends StatelessWidget {
  const LandscapeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Padding(
          padding: EdgeInsets.all(8.0),
          child: Text(
            'In landscape mode',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
        ),
        Expanded(
          child: GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2, // Two columns in landscape mode
              childAspectRatio: 5, // Controls the height of each item
            ),
            itemCount: 20,
            itemBuilder: (context, index) {
              return NumberBubble(number: index + 1);
            },
          ),
        ),
      ],
    );
  }
}