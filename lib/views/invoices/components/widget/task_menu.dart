import 'package:flutter/material.dart';

class TaskMenu extends StatefulWidget {
  const TaskMenu({Key? key, required this.updateDesiredStatus, required this.desiredStatus}) : super(key: key);

  final int desiredStatus;
  final Function(int) updateDesiredStatus;

  @override
  TaskMenuState createState() => TaskMenuState();
}

class TaskMenuState extends State<TaskMenu> {
  int selectedItemIndex = 1;

  void updateDesiredStatus(int status) {
    setState(() {
      selectedItemIndex = status;
    });
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
          buildTaskMenuItem('Chờ xác nhận', 1),
          const SizedBox(width: 20),
          buildTaskMenuItem('Chờ lấy hàng', 2),
          const SizedBox(width: 20),
          buildTaskMenuItem('Đang giao', 3),
          const SizedBox(width: 20),
          buildTaskMenuItem('Đã giao', 4),
          const SizedBox(width: 20),
          buildTaskMenuItem('Đã hủy', 5),
          const SizedBox(width: 20),
        ],
      ),
    );
  }

  Widget buildTaskMenuItem(String text, int status) {
    bool isSelected = widget.desiredStatus == status;

    return GestureDetector(
      onTap: () {
        setState(() {
          selectedItemIndex = status;
          widget.updateDesiredStatus(status); // Gọi hàm callback để cập nhật desiredStatus
        });
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(height: 10),
          Text(
            text,
            style: TextStyle(
              color: isSelected ? Colors.red : Colors.black,
              fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
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
