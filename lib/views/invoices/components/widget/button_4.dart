import 'package:flutter/material.dart';

import '../../../../data/models/invoices.dart';
import '../../api_service.dart';

class ButtonUp4 extends StatelessWidget {
  final Function() updateStatusCallback;
  final Invoice invoice;
  const ButtonUp4(
      {super.key, required this.updateStatusCallback, required this.invoice});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        ElevatedButton(
          onPressed: () {
            showDialog(
                context: context,
                builder: (BuildContext context) {
                  return AlertDialog(
                    content: const Text(
                      'Đặt lại đơn hàng này?',
                      style:
                          TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
                    ),
                    actions: [
                      ElevatedButton(
                        //Nút thay đổi trạng thái đơn hàng thành 3
                        //'Thông báo đơn hàng đang được giao'
                        onPressed: () async {
                          try {
                            await ApiService().updateInvoiceStatus1(invoice.id);
                            updateStatusCallback();
                          } catch (e) {
                            print('Update faile: $e');
                          }
                          Navigator.pop(context);
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.green, // Màu xanh
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(6),
                          ),
                        ),
                        child: const Text(
                          'Xác nhận',
                          style: TextStyle(
                              color: Colors.white, fontWeight: FontWeight.bold),
                        ),
                      ),
                      ElevatedButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.red, // Màu đỏ
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(6),
                          ),
                        ),
                        child: const Text(
                          'Không',
                          style: TextStyle(
                              color: Colors.white, fontWeight: FontWeight.bold),
                        ),
                      )
                    ],
                  );
                });
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.red,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(6),
            ),
          ),
          child: const Text(
            'Đặt lại',
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 17,
            ),
          ),
        ),
      ],
    );
  }
}
