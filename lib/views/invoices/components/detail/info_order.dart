import 'package:flutter/material.dart';
// import 'package:flutter_application_1/models/invoices.dart';
// import 'package:flutter_application_1/server/api_service.dart';

import 'package:intl/intl.dart';

import '../../../../data/models/invoices.dart';
import '../../api_service.dart';

class InfoOrder extends StatefulWidget {
  final Invoice invoice;
  const InfoOrder({Key? key, required this.invoice}) : super(key: key);

  @override
  InfoOrderState createState() => InfoOrderState();
}

class InfoOrderState extends State<InfoOrder> {
  String namePay = '';
  String nameAddress = '';
  String nameUser = '';
  Future<void> getInfo() async {
    try {
      var responseUser =
          await ApiService().getUser('users', widget.invoice.idUser);
      var responsePay =
          await ApiService().getPay('pay', widget.invoice.idPayment);
      var responseAddress =
          await ApiService().getAddress('address', widget.invoice.idAddress);
      setState(() {
        namePay = responsePay.name;
        nameAddress = responseAddress.address;
        nameUser = responseUser.name;
      });
    } catch (e) {
      print('Load Faild: $e');
    }
  }

  @override
  void initState() {
    super.initState();
    getInfo();
  }

  String getStatusText(int status) {
    switch (status) {
      case 1:
        return "Chờ xác nhận";
      case 2:
        return "Chờ lấy hàng";
      case 3:
        return "Đang giao hàng";
      case 4:
        return "Đã giao";
      case 5:
        return "Đã hủy";
      default:
        throw Exception("Trạng thái không hợp lệ");
    }
  }

  String getCreateAtString() {
    return DateFormat("dd-MM-yyyy")
        .format(DateTime.parse(widget.invoice.createAt));
  }

  @override
  Widget build(BuildContext context) {
    const double fontSize = 17;
    String createAtString = getCreateAtString();
    String formattedPrice =
        NumberFormat.currency(locale: 'vi_VN', symbol: 'VNĐ')
            .format(widget.invoice.totalPrice);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
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
          height: 3,
          color: Colors.red,
        ),
        const SizedBox(
          height: 10,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            buildInfoRow(
                'Mã đơn hàng:', widget.invoice.id.toString(), fontSize),
            buildInfoRow('Tên khách hàng:', nameUser, fontSize),
            buildInfoRow('Ngày đặt:', createAtString, fontSize),
            buildInfoRow('Phương thức thanh toán:', namePay, fontSize),
            buildInfoRow('Tổng tiền:', formattedPrice, fontSize),
            buildInfoRow(
                'Trạng thái:', getStatusText(widget.invoice.status), fontSize),
            buildInfoRow('Địa chỉ:', nameAddress, fontSize),
            buildInfoRow('Ghi chú:', widget.invoice.note, 16),
          ],
        )
      ],
    );
  }

  Widget buildInfoRow(String label, String value, double fontSize) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 150, // Set the width for the label
            child: Text(
              label,
              style: TextStyle(
                  fontSize: fontSize,
                  fontWeight: FontWeight.bold,
                  color: Colors.blue),
            ),
          ),
          const SizedBox(width: 10), // Add some spacing between label and value
          Expanded(
            child: Text(
              value,
              style: TextStyle(fontSize: fontSize),
            ),
          ),
        ],
      ),
    );
  }
}
