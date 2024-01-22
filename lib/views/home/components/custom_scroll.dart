import 'package:flutter/material.dart';

class CustomScroll extends StatefulWidget {
  const CustomScroll({super.key, required this.thumbPosition});
final double thumbPosition;
  @override
  State<CustomScroll> createState() => _CustomScrollState();
}

class _CustomScrollState extends State<CustomScroll> {
    
    
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          decoration: BoxDecoration(
              color: const Color.fromARGB(255, 194, 187, 187),
              borderRadius: BorderRadius.circular(2)),
          height: 2.8,
          width: 25,
        ),
        AnimatedPositioned(
            duration: const Duration(milliseconds: 100),
            left: widget.thumbPosition,
            child: Container(
              decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 211, 26, 26),
                  borderRadius: BorderRadius.circular(2)),
              height: 2.8,
              width: 8,
            ))
      ],
    );
  }
}