import 'package:flutter/material.dart';

class TaskMenu extends StatefulWidget {
  const TaskMenu({Key? key}) : super(key: key);

  @override
  TaskMenuState createState() => TaskMenuState();
}

class TaskMenuState extends State<TaskMenu> {
  int selectedItemIndex = 0; // Chỉ mục của mục được chọn, ban đầu là 0

  Color getTextColor(int index) {
    return index == selectedItemIndex ? Colors.red : Colors.black;
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100,
      child: Container(
        padding: const EdgeInsets.fromLTRB(10, 14, 10, 0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(6),
          border: Border.all(color: Colors.black, width: 2),
          color: Colors.white,
        ),
        child: ListView(
          scrollDirection: Axis.horizontal,
          children: [
            Expanded(
              flex: 2,
              child: buildTaskMenuItem('assets/Duy/1.png', 'Chờ xác nhận', 0),
            ),
            const SizedBox(width: 20),
            Expanded(
              flex: 2,
              child: buildTaskMenuItem('assets/Duy/2.png', 'Chờ lấy hàng', 1),
            ),
            const SizedBox(width: 20),
            Expanded(
              flex: 2,
              child: buildTaskMenuItem('assets/Duy/3.png', 'Đang giao', 2),
            ),
            const SizedBox(width: 20),
            Expanded(
              flex: 2,
              child: buildTaskMenuItem('assets/Duy/4.png', 'Đã giao', 3),
            ),
            const SizedBox(width: 20),
            Expanded(
              flex: 2,
              child: buildTaskMenuItem('assets/Duy/5.png', 'Đã hủy', 4),
            ),
            const SizedBox(width: 20),
          ],
        ),
      ),
    );
  }

  Widget buildTaskMenuItem(String imagePath, String text, int index) {
    bool isSelected = selectedItemIndex == index;

    return GestureDetector(
      onTap: () {
        setState(() {
          selectedItemIndex = index; // Cập nhật chỉ mục của mục được chọn
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
              color: getTextColor(
                  index), // Xác định màu sắc của chữ dựa trên chỉ mục
            ),
          ),
          const SizedBox(height: 5),
          if (isSelected) // Kiểm tra nếu isSelected là true thì hiển thị widget Center
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
