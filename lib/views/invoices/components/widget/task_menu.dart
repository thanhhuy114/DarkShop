import 'package:flutter/material.dart';

class TaskMenu extends StatefulWidget {
  const TaskMenu({Key? key}) : super(key: key);

  @override
  TaskMenuState createState() => TaskMenuState();
}

class TaskMenuState extends State<TaskMenu> {
  int selectedItemIndex = 0;

  Color getTextColor(int index) {
    return index == selectedItemIndex ? Colors.red : Colors.black;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      padding: const EdgeInsets.fromLTRB(10, 14, 10, 0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(6),
        color: Colors.white,
      ),
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: [
          buildTaskMenuItem('assets/Duy/1.png', 'Chờ xác nhận', 0),
          const SizedBox(width: 20),
          buildTaskMenuItem('assets/Duy/2.png', 'Chờ lấy hàng', 2),
          const SizedBox(width: 20),
          buildTaskMenuItem('assets/Duy/3.png', 'Đang giao', 3),
          const SizedBox(width: 20),
          buildTaskMenuItem('assets/Duy/4.png', 'Đã giao', 4),
          const SizedBox(width: 20),
          buildTaskMenuItem('assets/Duy/5.png', 'Đã hủy', 5),
          const SizedBox(width: 20),
        ],
      ),
    );
  }

  Widget buildTaskMenuItem(String imagePath, String text, int index) {
    bool isSelected = selectedItemIndex == index;

    return GestureDetector(
      onTap: () {
        setState(() {
          selectedItemIndex = index;
        });
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset(
            imagePath,
            width: 30,
            height: 30,
          ),
          const SizedBox(height: 10),
          Text(
            text,
            style: TextStyle(
              color: getTextColor(index),
            ),
          ),
          const SizedBox(height: 5),
          if (isSelected)
            Center(
              child: Container(
                width: 50,
                height: 8,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(2),
                  color: Colors.red,
                ),
              ),
            ),
        ],
      ),
    );
  }
}
