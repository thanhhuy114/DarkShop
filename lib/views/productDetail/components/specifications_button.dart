//nút chuyển màn thông số kỹ thuật
import 'package:darkshop/data/models/product.dart';
import 'package:darkshop/views/productDetail/productInfo_screen.dart';
import 'package:flutter/material.dart';

class specsButton extends StatefulWidget {
  final Product pro;
   specsButton({super.key,required this.pro});

  @override
  State<specsButton> createState() => _specsButtonState();
}

class _specsButtonState extends State<specsButton> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () {
          // Điều hướng đến màn hình phóng to ảnh và truyền danh sách URL hình ảnh
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => ProductInfoScreen(pro: widget.pro),
            ),
          );
        },
        child: Container(
          padding: const EdgeInsets.all(10),
          decoration: const BoxDecoration(
            color: Colors.white,
          ),
          child: const Column(
            children: [
              Icon(Icons.laptop_mac),
              Text(
                "Thông số kỹ thuật",
                textAlign: TextAlign.center,
              )
            ],
          ),
        ));
  }
}
