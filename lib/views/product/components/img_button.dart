//nhấn nút chuyển màn hình phóng to lướt ảnh thủ công
import 'package:flutter/material.dart';

class imgButton extends StatefulWidget {
  const imgButton({super.key});

  @override
  State<imgButton> createState() => _imgButtonState();
}

class _imgButtonState extends State<imgButton> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black.withOpacity(0.5),
      child: Column(
        children: [
          Image.network(
              'https://images.fpt.shop/unsafe/fit-in/960x640/filters:quality(90):fill(white):upscale()/fptshop.com.vn/Uploads/Originals/2022/4/20/637860593087770791_HASP-ASUS-FX506H-1.jpg',
              cacheHeight: 50,
              cacheWidth: 125),
          const Text('Xem thêm')
        ],
      ),
    );
  }
}
