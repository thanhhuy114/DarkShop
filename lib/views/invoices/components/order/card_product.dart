import 'package:flutter/material.dart';

class CardProduct extends StatelessWidget {
  const CardProduct({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(
          width: MediaQuery.of(context).size.width * 0.35,
          child: Image.asset(
            'assets/Duy/sp1.jpg',
            width: 150,
          ),
        ),
        const SizedBox(
          width: 10,
        ),
        const Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Laptop Apple MacBook Air 13 inch M1 2020 8-core CPU/8GB/256GB/7-core GPU (MGND3SA/A) ',
                softWrap: true,
                style: TextStyle(fontSize: 16),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
              Align(
                alignment: Alignment.centerRight,
                child: Text(
                  'x1',
                ),
              ),
              Align(
                alignment: Alignment.centerRight,
                child: Text(
                  '16.999.000.VNĐ',
                ),
              )
            ],
          ),
        )
      ],
    );
  }
}
