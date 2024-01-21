import 'package:flutter/material.dart';

class CountProduct extends StatefulWidget {
  int count;

  CountProduct({Key? key, required this.count}) : super(key: key);

  @override
  State<CountProduct> createState() => _CountProductState();
}

class _CountProductState extends State<CountProduct> {
  void _incrementCount() {
    setState(() {
      // Tăng giá trị count khi người dùng nhấn nút tăng
      if (widget.count < 9) {
        widget.count++;
      }
    });
  }

  void _decrementCount() {
    setState(() {
      // Giảm giá trị count khi người dùng nhấn nút giảm
      if (widget.count > 0) {
        widget.count--;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height / 20,
      padding: const EdgeInsets.all(2),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Colors.white,
        border: Border.all(width: 1),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          ElevatedButton.icon(
            onPressed: _decrementCount,
            icon: const Icon(Icons.arrow_back_ios_new),
            label: const Text(''),
            style: ButtonStyle(
              textStyle: MaterialStateProperty.all<TextStyle>(
                const TextStyle(fontWeight: FontWeight.w900),
              ),
              backgroundColor: MaterialStateProperty.all<Color>(Colors.red),
              iconSize: MaterialStateProperty.all(15),
              shape:
                  MaterialStateProperty.all<CircleBorder>(const CircleBorder()),
              padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
                const EdgeInsets.symmetric(vertical: 8),
              ),
            ),
          ),
          const SizedBox(width: 1),
          Text(
            widget.count.toString(),
            style: const TextStyle(
              fontWeight: FontWeight.w900,
              fontSize: 15,
            ),
          ),
          const SizedBox(width: 8),
          ElevatedButton.icon(
            onPressed: _incrementCount,
            icon: const Icon(Icons.arrow_forward_ios_outlined),
            label: const Text(''),
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all<Color>(Colors.red),
              iconSize: MaterialStateProperty.all(15),
              shape:
                  MaterialStateProperty.all<CircleBorder>(const CircleBorder()),
              padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
                const EdgeInsets.symmetric(vertical: 8),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
