import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../../../data/models/invoice_details.dart';
import '../../../../data/models/invoices.dart';
import '../../../../data/models/user2.dart';
import '../../api_service.dart';
import '../../screen/admin/order_detail_admin_screen.dart';
import '../widget/button_u_5.dart';
import '../widget/card_product.dart';

class ListOrderUser extends StatefulWidget {
  final int desiredStatus;
  const ListOrderUser({Key? key, required this.desiredStatus})
      : super(key: key);

  @override
  State<ListOrderUser> createState() => _ListOrderUserState();
}

class _ListOrderUserState extends State<ListOrderUser> {
  late ApiService apiService;
  List<Invoice> invoices = [];
  List<User2> users = [];
  List<InvoiceDetails> invoiceDetails = [];

  @override
  void initState() {
    super.initState();
    apiService = ApiService();
    fetchData();
  }

  Future<void> fetchData() async {
    try {
      List<Invoice> fetchedInvoices =
          await apiService.getAllInvoices('invoices');
      List<User2> fetchedUsers = await apiService.getAllUsers('users');
      List<InvoiceDetails> fetchedInvoiceDetails =
          await apiService.getAllInvoiceDetails('invoice_details');

      setState(() {
        invoices = fetchedInvoices;
        invoiceDetails = fetchedInvoiceDetails;
        users = fetchedUsers;
      });
    } catch (e) {
      // ignore: avoid_print
      print('Failed to fetch invoices: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        itemCount: invoices.length,
        itemBuilder: (context, index) {
          Invoice invoice = invoices[index];
          InvoiceDetails? relatedInvoiceDetails;
          User2? tempUser;
          String formattedPrice = '';
          String baseUrl =
              'https://res.cloudinary.com/dvrzyngox/image/upload/v1705543245/';

          for (InvoiceDetails detail in invoiceDetails) {
            if (detail.idInvoice == invoice.id) {
              relatedInvoiceDetails = detail;
              break;
            }
          }
          for (User2 temp in users) {
            if (temp.id == invoice.idUser) {
              tempUser = temp;
              break;
            }
          }
          formattedPrice = NumberFormat.currency(locale: 'vi_VN', symbol: 'VNĐ')
              .format(invoice.totalPrice);

          if (invoice.status == widget.desiredStatus) {
            return GestureDetector(
              onDoubleTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => OrderAdminDetail(invoice: invoice,)),
                );
              },
              child: Container(
                // height: 380,
                padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
                margin: const EdgeInsets.fromLTRB(10, 10, 10, 0),
                width: MediaQuery.of(context).size.width * 0.9,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    color: Colors.white),
                child: Column(children: [
                  //Avatar và tên kh
                  Row(
                    children: [
                      if (tempUser != null && tempUser.image != null)
                        Container(
                          width: 40,
                          height: 40,
                          decoration: const BoxDecoration(
                            color: Colors.white,
                            shape: BoxShape.circle,
                          ),
                          child: ClipOval(
                            child: Image.network(
                              baseUrl + tempUser.image!,
                              width: 30,
                              height: 30,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      const SizedBox(
                        width: 10,
                      ),
                      if (tempUser != null)
                        Text(
                          tempUser.name,
                          style: const TextStyle(fontSize: 17),
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
                  //Invoice Details
                  CardInvoiceDetail(
                      relatedInvoiceDetails: relatedInvoiceDetails),
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
                  Text(
                    'Tổng tiền: $formattedPrice',
                    style: const TextStyle(
                        fontSize: 17, fontWeight: FontWeight.bold),
                  ),
                  //khoảng cách
                  const SizedBox(
                    height: 10,
                  ),
                  //nút
                  if (invoice.status == 1)
                    const Text('Chờ xác nhận đơn hàng'),
                  if (invoice.status == 2)
                    const Text('Đơn hàng đang được chuẩn bị'),
                  if (invoice.status == 3)
                    const Text('Đơn hàng đang được vận chuyển'),
                  if (invoice.status == 4) const Text('Giao hàng thành công'),
                  if (invoice.status == 5)
                    ButtonUp5(
                        invoice: invoice, updateStatusCallback: fetchData),
                  //mã đơn hàng
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text('Mã đơn hàng:'),
                        Text(invoice.id.toString()),
                      ],
                    ),
                  ),
                ]),
              ),
            );
          } else {
            return const SizedBox.shrink();
          }
        },
      ),
    );
  }
}
