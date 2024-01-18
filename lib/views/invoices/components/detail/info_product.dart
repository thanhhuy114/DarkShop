// import 'package:darkshop/views/invoices/card_product.dart';
import 'package:darkshop/views/invoices/components/widget/card_product.dart';
import 'package:flutter/material.dart';

class InfoProduct extends StatelessWidget {
  const InfoProduct({super.key});

  static const double fontSize = 17;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Align(
          alignment: Alignment.center,
          child: Text(
            'Sản phẩm đặt mua',
            style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        //đường kẻ
        Container(
          height: 3,
          color: Colors.red,
        ),
        //khoảng cách
        const SizedBox(
          height: 10,
        ),
        //list sp
        Expanded(
          flex: 2,
          child: ListView(
            children: const [
              CardProduct(),
              SizedBox(
                height: 10,
              ),
              CardProduct(),
              SizedBox(
                height: 10,
              ),
              CardProduct(),
              SizedBox(
                height: 10,
              ),
              CardProduct(),
            ],
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        //tổng tiền:
        const Text(
          'Tổng tiền:',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
      ],
    );
  }
}

// Align(
//           alignment: Alignment.topLeft,
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Image.asset(
//                 'assets/Duy/sp1.jpg',
//                 width: MediaQuery.of(context).size.width * 0.9,
//               ),
//               const Text(
//                 'Mã sản phẩm: ',
//                 style: TextStyle(fontSize: fontSize),
//               ),
//               const Text(
//                 'Tên sản phẩm: ',
//                 style: TextStyle(fontSize: fontSize),
//               ),
//               const Text(
//                 'Giá: ',
//                 style: TextStyle(fontSize: fontSize),
//               ),
//               const Text(
//                 'Thông tin chi tiết: ',
//                 style: TextStyle(fontSize: fontSize),
//               ),
//             ],
//           ),
//         ),