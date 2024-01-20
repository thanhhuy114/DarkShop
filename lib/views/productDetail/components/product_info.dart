//thông tin sản phẩm
import 'dart:ffi';

import 'package:flutter/material.dart';

class ProductInfo extends StatelessWidget {
  bool lineShow=true;
  final String textInfo;
   ProductInfo({required this.textInfo,required this.lineShow});

  @override
  Widget build(BuildContext context) {
    final List<String> lines = textInfo.split('\n');

    return Container(
      margin: const EdgeInsets.all(10),
      width: MediaQuery.of(context).size.width - 20,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              for ( String line in lines.take(lineShow ? 10:lines.length))
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      line.trim(),
                      style: const TextStyle(fontSize: 16.0),
                    ),
                    const SizedBox(height: 8.0),
                  ],
                ),
            ],
          ),
        ),
      ),
    );
  }
}
