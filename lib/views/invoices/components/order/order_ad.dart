import 'package:darkshop/views/invoices/components/order/card_product.dart';
import 'package:darkshop/views/invoices/components/order/two_button.dart';
import 'package:darkshop/views/invoices/order_detail_u_screen.dart';
import 'package:flutter/material.dart';

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
        height: 400,
        padding: const EdgeInsets.all(10),
        margin: const EdgeInsets.fromLTRB(10, 10, 10, 0),
        width: MediaQuery.of(context).size.width * 0.9,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            border: Border.all(color: Colors.black, width: 2),
            color: const Color.fromARGB(255, 206, 224, 233)),
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
            // margin: const EdgeInsets.symmetric(horizontal: 10),
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
            margin: const EdgeInsets.symmetric(horizontal: 10),
            height: 1,
            color: Colors.black,
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
            height: 20,
          ),
          //nút xác nhận,hủy
          const TwoButton(),
          //khoảng cách
          const SizedBox(
            width: 10,
          ),
          //mã đơn hàng
          const Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Mã đơn hàng:'),
              Text('001'),
            ],
          )
        ]),
      ),
    );
  }
}