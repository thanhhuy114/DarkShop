import 'package:flutter/material.dart';

class InfoOrder extends StatelessWidget {
  const InfoOrder({super.key});

  static const double fontSize = 17;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Align(
          alignment: Alignment.center,
          child: Text(
            'Thông tin đơn hàng',
            style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
          ),
        ),
        const SizedBox(
          height: 5,
        ),
        Container(
          // margin: const EdgeInsets.symmetric(horizontal: 10),
          height: 2,
          color: Colors.red,
        ),
        const SizedBox(
          height: 10,
        ),
        Align(
          alignment: Alignment.topLeft,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: const [
              Text(
                'Mã đơn hàng: ',
                style: TextStyle(fontSize: fontSize),
              ),
              Text(
                'Tên khách hàng: ',
                style: TextStyle(fontSize: fontSize),
              ),
              Text(
                'Ngày đặt: ',
                style: TextStyle(fontSize: fontSize),
              ),
              Text(
                'Phương thức thanh toán: ',
                style: TextStyle(fontSize: fontSize),
              ),
              Text(
                'Tổng tiền: ',
                style: TextStyle(fontSize: fontSize),
              ),
              Text(
                'Trạng thái: ',
                style: TextStyle(fontSize: fontSize),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
