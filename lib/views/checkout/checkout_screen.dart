import 'package:darkshop/utils/screen_size.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class CheckoutScreen extends StatefulWidget {
  const CheckoutScreen({super.key});

  @override
  State<CheckoutScreen> createState() => _CheckoutScreenState();
}

class _CheckoutScreenState extends State<CheckoutScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.primaryContainer,
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {},
            icon: Icon(
              size: screenWidth * 0.075,
              Icons.arrow_back,
              color: Colors.black,
            )),
        title: Text(
          'Thanh toán',
          style: TextStyle(
              fontSize: screenWidth * 0.05,
              color: const Color.fromARGB(255, 203, 66, 107)),
        ),
      ),
      body: SingleChildScrollView(
          child: Column(children: [
        _buildAddressInfo(),
        Container(height: screenWidth * 0.055, color: Colors.transparent),
        _buildBroductOrder(),
        const SizedBox(height: 5),
        _buildPaymentMethod(),
        Container(
            padding: const EdgeInsets.all(10),
            height: screenHeight * 0.1,
            color: const Color.fromARGB(255, 225, 224, 221),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Tiền tạm tính',
                        style: TextStyle(
                            color: const Color.fromARGB(255, 121, 120, 118),
                            fontWeight: FontWeight.w400,
                            fontSize: screenWidth * 0.038)),
                    Text('100.000.000 ₫',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: screenWidth * 0.038))
                  ],
                ),
                const SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Phí vận chuyển',
                        style: TextStyle(
                            color: const Color.fromARGB(255, 121, 120, 118),
                            fontWeight: FontWeight.w400,
                            fontSize: screenWidth * 0.038)),
                    Text('30.000 ₫',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: screenWidth * 0.036))
                  ],
                )
              ],
            ))
      ])),
      bottomNavigationBar: _buildBottmBar(),
    );
  }

  Widget _buildPaymentMethod() {
    return Container(
      padding: const EdgeInsets.all(10),
      height: screenHeight * 0.16,
      width: double.infinity,
      child: Column(children: [
        Row(children: [
          Text(
            'Chọn phương thức thanh toán',
            style: TextStyle(
                fontSize: screenWidth * 0.038,
                color: const Color.fromARGB(255, 203, 66, 107),
                fontWeight: FontWeight.bold),
            textAlign: TextAlign.start,
          )
        ]),
        const SizedBox(height: 5),
        SizedBox(
          height: screenWidth * 0.208,
          child: MasonryGridView.count(
            itemCount: 5,
            // padding:   EdgeInsets.only(left: 20),
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) => Container(
              padding: const EdgeInsets.all(3),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: const Color.fromARGB(255, 244, 241, 241),
                  border: Border.all(
                      color: const Color.fromARGB(249, 149, 148, 155))),
              width: screenWidth * 0.61,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Image.asset('assets/checkout_screen/cash.png',
                          height: screenWidth * 0.083,
                          width: screenWidth * 0.083),
                      const SizedBox(width: 5),
                      Text(
                        'Thanh toán khi nhận hàng',
                        style: TextStyle(
                            color: const Color.fromARGB(255, 126, 124, 124),
                            fontWeight: FontWeight.bold,
                            fontSize: screenWidth * 0.034),
                      )
                    ],
                  ),
                  Padding(
                    padding:
                        EdgeInsets.only(left: screenWidth * 0.038, bottom: 2),
                    child: Row(
                      children: [
                        Text('Thanh toán khi nhận hàng',
                            style: TextStyle(
                                color: const Color.fromARGB(255, 126, 124, 124),
                                fontWeight: FontWeight.w500,
                                fontSize: screenWidth * 0.034))
                      ],
                    ),
                  )
                ],
              ),
            ),
            crossAxisCount: 1,
            mainAxisSpacing: screenWidth * 0.027,
          ),
        )
      ]),
    );
  }

  Container _buildBroductOrder() {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 2),
      padding: const EdgeInsets.all(10),
      height: 125,
      color: const Color.fromARGB(255, 231, 228, 225),
      child: Column(children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(
              'assets/home_screen/product_test.jpg',
              fit: BoxFit.contain,
              height: 80,
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(top: 0, left: 8),
                child: SizedBox(
                  height: 104,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'Laptop Lenovo Thinkpad P52 Core i7-8750H, Ram 32GB, SSD 512GB, 15.6 Inch FHD, Nvidia Quadro P1000',
                        style: TextStyle(
                            fontSize: 11.5, fontWeight: FontWeight.w400),
                        maxLines: 3,
                        overflow: TextOverflow.ellipsis,
                      ),
                      const SizedBox(height: 29),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: const [
                          Text('100.000.000 ₫',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 11)),
                          Text('Số lượng: 100',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 10))
                        ],
                      )
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ]),
    );
  }

  Container _buildAddressInfo() {
    return Container(
      height: 105,
      decoration:
          const BoxDecoration(color: Color.fromARGB(255, 231, 228, 225)),
      child: Row(children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(height: 15),
            Image.asset('assets/checkout_screen/location.png',
                height: 47, width: 47)
          ],
        ),
        const SizedBox(width: 3),
        Expanded(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                children: const [
                  Text(
                    'Võ Thành Huy',
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 15.2),
                  ),
                  SizedBox(width: 5),
                  Text(
                    '0944221401',
                    style: TextStyle(color: Colors.grey, fontSize: 13),
                  )
                ],
              ),
              const SizedBox(height: 6),
              const Text(
                '42/76 Hoàng Hoa Thám, Q.Bình Thạnh, P.7, TP.Hồ Chí Minh',
                style: TextStyle(
                    color: Color.fromARGB(255, 63, 60, 60),
                    fontSize: 12,
                    overflow: TextOverflow.ellipsis),
                maxLines: 4,
              )
            ],
          ),
        ),
        IconButton(
            onPressed: () {}, icon: const Icon(Icons.arrow_forward_ios_rounded))
      ]),
    );
  }

  Container _buildBottmBar() {
    return Container(
      decoration: const BoxDecoration(
          color: Color.fromARGB(255, 255, 207, 141),
          borderRadius: BorderRadius.vertical(top: Radius.circular(35))),
      height: 64,
      child: Row(mainAxisAlignment: MainAxisAlignment.end, children: [
        const Text(
          'Tổng cộng: ',
          style: TextStyle(
              color: Color.fromARGB(255, 117, 117, 117),
              fontWeight: FontWeight.bold),
        ),
        Text('117.000.000 ₫',
            style: TextStyle(
                color: const Color.fromARGB(255, 203, 34, 85),
                fontWeight: FontWeight.w800,
                fontSize: screenWidth * 0.0458)),
        const SizedBox(width: 6),
        ElevatedButton(
            style: ButtonStyle(
                shape: MaterialStatePropertyAll(RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25))),
                minimumSize: MaterialStatePropertyAll(
                    Size(screenWidth * 0.21, screenWidth * 0.12)),
                backgroundColor: const MaterialStatePropertyAll(
                    Color.fromARGB(255, 203, 66, 107))),
            onPressed: () {},
            child: Text('Đặt hàng',
                style: TextStyle(fontSize: screenWidth * 0.038))),
        SizedBox(width: screenWidth * 0.035)
      ]),
    );
  }
}
