import 'package:darkshop/views/invoices/components/widget/card_product.dart';
import 'package:darkshop/views/invoices/components/widget/two_button.dart';
// import 'package:darkshop/views/invoices/screen/admin/order_detail_admin_screen.dart';
// import 'package:darkshop/views/invoices/order_detail_admin_screen.dart';
import 'package:flutter/material.dart';

import '../../screen/admin/order_detail_admin_screen.dart';

class OrderAd extends StatelessWidget {
  const OrderAd({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onDoubleTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const OrderAdminDetail()),
        );
      },
      child: Container(
        height: 395,
        padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
        margin: const EdgeInsets.fromLTRB(10, 10, 10, 0),
        width: MediaQuery.of(context).size.width * 0.9,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5), color: Colors.white),
        child: Column(children: [
          //Avatar và tên kh
          Row(
            children: [
              Container(
                width: 40,
                height: 40,
                decoration: const BoxDecoration(
                  color: Colors.white,
                  shape: BoxShape.circle,
                ),
                child: ClipOval(
                  child: Image.asset(
                    'assets/Duy/sp1.jpg',
                    width: 30,
                    height: 30,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              const SizedBox(
                width: 10,
              ),
              const Text(
                'Tên khách hàng 1',
                style: TextStyle(fontSize: 17),
              )
            ],
          ),
          //khoảng cách
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
          SizedBox(
            height: 180,
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
              ],
            ),
          ),
          //khoảng cách
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
          //tổng tiền:
          const Text(
            'Tổng tiền:',
            style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
          ),
          //khoảng cách
          const SizedBox(
            height: 10,
          ),
          //nút xác nhận,hủy
          const TwoButton(),
          //mã đơn hàng
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: const [
              Text('Mã đơn hàng:'),
              Text('001'),
            ],
          )
        ]),
      ),
    );
  }
}
