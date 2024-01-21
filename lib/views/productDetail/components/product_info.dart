import 'package:flutter/material.dart';

class ProductInfo extends StatelessWidget {
  final bool lineShow;
  final String textInfo;

  ProductInfo({required this.textInfo, required this.lineShow});

  @override
  Widget build(BuildContext context) {
    final List<String> lines = textInfo.split('\n');

    return Container(
      margin: const EdgeInsets.all(10),
      width: MediaQuery.of(context).size.width - 20,
      height: MediaQuery.of(context).size.height / 2.5,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: ListView.builder(
          itemCount: lineShow ? lines.take(10).length : lines.length,
          itemBuilder: (BuildContext context, int index) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  lines[index].trim(),
                  style: const TextStyle(fontSize: 16.0),
                ),
                const SizedBox(height: 8.0),
              ],
            );
          },
        ),
      ),
    );
  }
}
