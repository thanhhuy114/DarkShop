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
          backgroundColor: Colors.redAccent,
        ),
        body: Container(
          decoration: const BoxDecoration(color: Colors.amber),
          child: const Column(
            children: [ItemImg(), Text('data')],
          ),
        ));
  }
}
