import 'package:flutter/material.dart';

class countProduct extends StatelessWidget {
  int count;
  countProduct({super.key, required this.count});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height / 20,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Colors.white,
          border: Border.all(width: 1)),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          ElevatedButton.icon(
              onPressed: () {},
              icon: const Icon(Icons.minimize_rounded),
              style: const ButtonStyle(iconSize: MaterialStatePropertyAll(15)),
              label: const Text('')),
          Text(count.toString()),
          ElevatedButton.icon(
              onPressed: () {},
              icon: const Icon(Icons.add),
              label: const Text(' '))
        ],
      ),
    );
  }
}
