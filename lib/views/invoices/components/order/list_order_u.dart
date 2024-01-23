import 'package:darkshop/utils/global_data.dart';
import 'package:darkshop/views/invoices/components/widget/button_4.dart';
import 'package:darkshop/views/invoices/screen/user/order_detail_user_screen.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../../../data/models/invoice_details.dart';
import '../../../../data/models/invoices.dart';
import '../../../../data/models/product2.dart';
import '../../../../data/models/user2.dart';
import '../../api_service.dart';
import '../widget/button_5.dart';
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
  List<Invoice> lstInvoices = [];
  List<User2> lstUsers = [];
  List<InvoiceDetails> lstInvoiceDetails = [];
  List<Product2> listProducts = [];

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
      var responseProducts = await ApiService().getAllProducts('products');

      setState(() {
        lstInvoices = fetchedInvoices;
        lstInvoiceDetails = fetchedInvoiceDetails;
        lstUsers = fetchedUsers;
        listProducts = responseProducts;
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
        itemCount: lstInvoices.length,
        itemBuilder: (context, index) {
          List<Color> itemColors = [
            Colors.blue,
            Colors.green,
            Colors.orange,
            Colors.purple
          ];
          Color itemColor = itemColors[index % itemColors.length];
          Invoice invoice = lstInvoices[index];
          User2? tempUser;
          String formattedPrice = '';
          String baseUrl =
              'https://res.cloudinary.com/dvrzyngox/image/upload/v1705543245/';

          for (User2 temp in lstUsers) {
            if (temp.id == invoice.idUser) {
              tempUser = temp;
              break;
            }
          }
          formattedPrice = NumberFormat.currency(locale: 'vi_VN', symbol: 'VNĐ')
              .format(invoice.totalPrice);

          bool hasValidInvoiceDetails = lstInvoiceDetails.any((inDetail) =>
              inDetail.idInvoice == invoice.id &&
              invoice.idUser == GlobalData.user!.id &&
              invoice.status == widget.desiredStatus);

          if (hasValidInvoiceDetails) {
            return GestureDetector(
              onDoubleTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => OrderUserDetail(
                            invoice: invoice,
                          )),
                );
              },
              child: Container(
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
                  const SizedBox(
                    height: 10,
                  ),
                  Container(
                    height: 3,
                    color: Colors.red,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  //List Invoice Details
                  SizedBox(
                      height: 200,
                      child: ListView.builder(
                          itemCount: lstInvoiceDetails.length,
                          itemBuilder: (context, index) {
                            InvoiceDetails inDetail = lstInvoiceDetails[index];

                            for (var temp in lstInvoiceDetails) {
                              if (temp.id == invoice.id) {
                                inDetail = temp;
                                break;
                              }
                            }

                            return CardInvoiceDetail(
                                relatedInvoiceDetails: inDetail,
                                itemColor: itemColor);
                          })),

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
                        fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  //khoảng cách
                  const SizedBox(
                    height: 10,
                  ),
                  //nút
                  if (invoice.status == 1) const Text('Chờ xác nhận đơn hàng'),
                  if (invoice.status == 2)
                    const Text('Đơn hàng đang được chuẩn bị'),
                  if (invoice.status == 3)
                    FutureBuilder<void>(
                      future: Future.delayed(const Duration(seconds: 5)),
                      builder: (context, snapshot) {
                        if (snapshot.connectionState == ConnectionState.done) {
                          apiService.updateInvoiceStatus4(invoice.id);
                          fetchData();
                        }
                        return Container();
                      },
                    ),
                  if (invoice.status == 3)
                    const Text('Đơn hàng đang được vận chuyển'),

                  //Thêm thông báo 'Giao hàng thành công' khi thuộc tính status của invoice = 4
                  if (invoice.status == 4)
                    Column(
                      children: [
                        ButtonUp4(
                            updateStatusCallback: fetchData, invoice: invoice),
                        const SizedBox(
                          height: 10,
                        ),
                        const Text('Giao hàng thành công'),
                      ],
                    ),

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
                  const SizedBox(
                    height: 10,
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
