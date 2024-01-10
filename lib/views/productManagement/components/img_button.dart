import 'package:flutter/material.dart';
import 'package:dotted_border/dotted_border.dart';

class ImgButton extends StatelessWidget {
  final VoidCallback onPressed;
  const ImgButton({super.key, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return DottedBorder(
      color: Colors.amber, // Border color
      strokeWidth: 2,
      dashPattern: const [6, 3],
      borderType: BorderType.RRect,
      radius: const Radius.circular(12),
      child: GestureDetector(
        onTap: onPressed,
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
          ),
          child: Text('Thêm ảnh'),
        ),
      ),
    );
  }
}
