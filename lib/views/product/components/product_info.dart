//thông tin sản phẩm
import 'package:darkshop/views/product/components/button.dart';
import 'package:flutter/material.dart';

class productInfo extends StatelessWidget {
  final String textInfo;
  const productInfo({required this.textInfo});

  @override
  Widget build(BuildContext context) {
    return Container(
        width: MediaQuery.of(context).size.width - 20,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  for (String line in textInfo.split('\n'))
                    Text(
                      line.trim(),
                      style: TextStyle(fontSize: 16.0),
                    ),
                ],
              ),
            ),
          ),
        ));
  }
}
