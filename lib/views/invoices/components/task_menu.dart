import 'package:flutter/material.dart';

class TaskMenu extends StatelessWidget {
  const TaskMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 80,
      child: Container(
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(6),
            color: Colors.white,
          ),
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: [
              buildTaskMenuItem('assets/Duy/1.png', 'Chờ xác nhận'),
              const SizedBox(width: 10),
              buildTaskMenuItem('assets/Duy/2.png', 'Chờ lấy hàng'),
              const SizedBox(width: 10),
              buildTaskMenuItem('assets/Duy/3.png', 'Đang giao'),
              const SizedBox(width: 10),
              buildTaskMenuItem('assets/Duy/4.png', 'Đã giao'),
            ],
          )),
    );
  }
}

Widget buildTaskMenuItem(String imagePath, String text) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.center,
    children: [
      Image.asset(
        imagePath,
        width: 30,
        height: 30,
      ),
      const SizedBox(height: 10),
      Text(text)
    ],
  );
}
