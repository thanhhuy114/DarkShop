import 'package:darkshop/views/invoices/components/detail/info_order.dart';
import 'package:darkshop/views/invoices/components/detail/info_product.dart';
import 'package:flutter/material.dart';

import '../../../../data/models/invoices.dart';

class OrderAdminDetail extends StatefulWidget {
  final Invoice invoice;
  const OrderAdminDetail({Key? key, required this.invoice}) : super(key: key);

  @override
  OrderAdminDetailState createState() => OrderAdminDetailState();
}

class OrderAdminDetailState extends State<OrderAdminDetail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 255, 185, 88),
      appBar: AppBar(
        title: const Text(
          'Chi tiết đơn hàng',
          style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: ListView(
        children: [
          Container(
            height: MediaQuery.of(context).size.height * 0.55,
            margin: const EdgeInsets.all(5),
            padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              color: Colors.white,
            ),
            child: InfoOrder(
              invoice: widget.invoice,
            ),
          ),
          Container(
            height: MediaQuery.of(context).size.height * 0.45,
            margin: const EdgeInsets.all(5),
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              color: Colors.white,
            ),
            child: InfoProduct(invoice: widget.invoice),
          ),
        ],
      ),
    );
  }
}
