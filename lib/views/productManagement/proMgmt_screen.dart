//giao diện quan ly san pham
import 'package:darkshop/views/productManagement/components/PM/item.dart';
import 'package:flutter/material.dart';

class proMgmtScreen extends StatefulWidget {
  const proMgmtScreen({super.key});

  @override
  State<proMgmtScreen> createState() => _proMgmtScreenState();
}

class _proMgmtScreenState extends State<proMgmtScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Quản lý sản phẩm'),
          backgroundColor: Colors.redAccent,
          actions: [IconButton(onPressed: () {}, icon: const Icon(Icons.add))],
        ),
        body: Container(
          color: Colors.amber,
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                children: [
                  itemProduct(
                      id: 0,
                      name: 'PC GVN Intel i5-12400F/ VGA RTX 4060',
                      price: 24490000),
                  itemProduct(
                      id: 0,
                      name: 'PC GVN Intel i5-12400F/ VGA RTX 4060',
                      price: 24490000),
                  itemProduct(
                      id: 0,
                      name: 'PC GVN Intel i5-12400F/ VGA RTX 4060',
                      price: 24490000),
                  itemProduct(
                      id: 0,
                      name: 'PC GVN Intel i5-12400F/ VGA RTX 4060',
                      price: 24490000),
                  itemProduct(
                      id: 0,
                      name: 'PC GVN Intel i5-12400F/ VGA RTX 4060',
                      price: 24490000),
                ],
              ),
            ),
          ),
        ));
  }
}
