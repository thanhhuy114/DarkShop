import 'package:flutter/material.dart';

class Combobox extends StatefulWidget {
  @override
  _ComboboxState createState() => _ComboboxState();
}

class _ComboboxState extends State<Combobox> {
  String selectedValue = 'Chọn loại sản phẩm';

  @override
  Widget build(BuildContext context) {
    return DropdownButton<String>(
      value: selectedValue,
      onChanged: (String? newValue) {
        setState(() {
          selectedValue = newValue!;
        });
      },
      items: <String>['Laptop', 'PC', 'TV', 'Linh kiện']
          .map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
    );
  }
}
