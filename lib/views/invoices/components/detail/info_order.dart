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
      print(e);
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
    String formattedPrice = '';
    formattedPrice = NumberFormat.currency(locale: 'vi_VN', symbol: 'VNĐ')
        .format(widget.invoice.totalPrice);
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
            children: [
              Text(
                'Mã đơn hàng: ${widget.invoice.id.toString()}',
                style: const TextStyle(fontSize: fontSize),
              ),
              Text(
                'Tên khách hàng: $nameUser',
                style: const TextStyle(fontSize: fontSize),
              ),
              Text(
                'Ngày đặt: $createAtString',
                style: const TextStyle(fontSize: fontSize),
              ),
              Text(
                'Phương thức thanh toán: $namePay',
                style: const TextStyle(fontSize: fontSize),
              ),
              Text(
                'Tổng tiền: $formattedPrice',
                style: const TextStyle(fontSize: fontSize),
              ),
              Text(
                'Trạng thái: ${getStatusText(widget.invoice.status)}',
                style: const TextStyle(fontSize: fontSize),
              ),
              Text(
                'Địa chỉ: $nameAddress',
                style: const TextStyle(fontSize: fontSize),
              ),
              Text(
                'Ghi chú: ${widget.invoice.note}',
                softWrap: true,
                style: const TextStyle(fontSize: 16),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
