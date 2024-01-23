import 'package:darkshop/utils/untils.dart';
import 'package:flutter/material.dart';

class CartTotal extends StatefulWidget {
  double total;
  CartTotal({super.key, required this.total});

  @override
  State<CartTotal> createState() => _CartTotalState();
}

class _CartTotalState extends State<CartTotal> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.amber.withOpacity(0.5),
      height: 80,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Text(
                'Tổng số tiền cần thanh toán \n',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              Text(
                formatCurrency(widget.total.toInt()),
                style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.redAccent,
                    fontSize: 20),
              )
            ],
          ),
          const SizedBox(
            width: 0,
          ),
          Container(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width / 3,
              decoration: const BoxDecoration(color: Colors.redAccent),
              child: const Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Thanh toán',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: 10,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                ],
              ))
        ],
      ),
    );
  }
}
