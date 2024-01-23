import 'package:darkshop/utils/untils.dart';
import 'package:flutter/material.dart';

class CustomButtonCart extends StatefulWidget {
  final String text;
  final IconData icon;
  final int id_product;
  final void Function(int quantity) onQuantitySelected; // Callback

  const CustomButtonCart({
    super.key,
    required this.text,
    required this.icon,
    required this.id_product,
    required this.onQuantitySelected, // Callback được truyền vào constructor
  });

  @override
  _CustomButtonCartState createState() => _CustomButtonCartState();
}

class _CustomButtonCartState extends State<CustomButtonCart> {
  final TextEditingController _quantityController =
      TextEditingController(text: '1');
  int count = 1;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      onPressed: () {
        _showQuantityDialog(context);
      },
      style: ButtonStyle(
        fixedSize: MaterialStateProperty.all(const Size.fromHeight(50)),
        backgroundColor:
            const MaterialStatePropertyAll(Color.fromARGB(255, 203, 66, 107)),
        iconColor: const MaterialStatePropertyAll(Colors.amberAccent),
      ),
      icon: Icon(widget.icon, size: screenWidth * 0.056),
      label: Row(
        children: [
          Text(
            widget.text,
            style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: screenWidth * 0.037),
          ),
        ],
      ),
    );
  }

  void _showQuantityDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Nhập số lượng'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextFormField(
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(labelText: 'Số lượng'),
                controller: _quantityController,
              ),
              const SizedBox(height: 50),
              ElevatedButton(
                onPressed: () {
                  int quantity = int.tryParse(_quantityController.text) ?? 1;
                  widget.onQuantitySelected(quantity); // Gọi callback
                  Navigator.of(context).pop();
                },
                child: const Text('Xác nhận'),
              ),
            ],
          ),
        );
      },
    );
  }
}
