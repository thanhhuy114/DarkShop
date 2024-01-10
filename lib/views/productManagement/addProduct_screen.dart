import 'package:darkshop/views/productManagement/components/itemImg_list.dart';
import 'package:flutter/material.dart';

class addProSCreen extends StatefulWidget {
  const addProSCreen({super.key});

  @override
  State<addProSCreen> createState() => _addProSCreenState();
}

class _addProSCreenState extends State<addProSCreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Thêm sản phẩm '),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(20),
          child: Column(
            children: [itemImg()],
          ),
        ),
      ),
    );
  }
}
