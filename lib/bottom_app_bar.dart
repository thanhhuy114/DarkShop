import 'package:flutter/material.dart';

class CustomBottomAppBar extends StatelessWidget {
  final int currentIndex;
  final Function(int) onTap;

  const CustomBottomAppBar({
    super.key,
    required this.currentIndex,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      shape: const CircularNotchedRectangle(),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          IconButton(
            icon: const Icon(Icons.home),
            onPressed: () {
              onTap(0);
            },
            color: currentIndex == 0 ? Colors.blue : Colors.black,
          ),
          IconButton(
            icon: const Icon(Icons.add_box),
            onPressed: () {
              onTap(1);
            },
            color: currentIndex == 1 ? Colors.blue : Colors.black,
          ),
          IconButton(
            icon: const Icon(Icons.card_travel),
            onPressed: () {
              onTap(2);
            },
            color: currentIndex == 2 ? Colors.blue : Colors.black,
          ),
          IconButton(
            icon: const Icon(Icons.person),
            onPressed: () {
              onTap(3);
            },
            color: currentIndex == 3 ? Colors.blue : Colors.black,
          ),
        ],
      ),
    );
  }
}
