import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../../../data/models/invoice_details.dart';
import '../../../../data/models/invoices.dart';
import '../../../../data/models/product2.dart';
import '../../api_service.dart';

class InfoProduct extends StatefulWidget {
  final Invoice invoice;
  const InfoProduct({super.key, required this.invoice});

  @override
  State<InfoProduct> createState() => _InfoProductState();
}

class _InfoProductState extends State<InfoProduct> {
  List<InvoiceDetails> listIDetails = [];
  List<Product2> listProducts = [];
  String baseUrl =
      'https://res.cloudinary.com/dvrzyngox/image/upload/v1705543245/';

  Future<void> getInfo() async {
    try {
      var responseIDetails =
          await ApiService().getAllInvoiceDetails('invoice_details');
      var responseProducts = await ApiService().getAllProducts('products');
      List<InvoiceDetails> filteredList = [];

      for (var temp in responseIDetails) {
        if (temp.idInvoice == widget.invoice.id) {
          filteredList.add(temp);
        }
      }
      setState(() {
        listIDetails = filteredList;
        listProducts = responseProducts;
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

  @override
  Widget build(BuildContext context) {
    String formattedPriceInvoice = '';
    formattedPriceInvoice =
        NumberFormat.currency(locale: 'vi_VN', symbol: 'VNĐ')
            .format(widget.invoice.totalPrice);

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
        Expanded(
            child: ListView.builder(
                itemCount: listIDetails.length,
                itemBuilder: (context, index) {
                  InvoiceDetails inDetail = listIDetails[index];
                  String formattedPriceIDetails = '';
                  Product2? product;

                  for (var temp in listProducts) {
                    if (temp.id == inDetail.idProduct) {
                      product = temp;
                    }
                  }
                  formattedPriceIDetails =
                      NumberFormat.currency(locale: 'vi_VN', symbol: 'VNĐ')
                          .format(inDetail.totalPrice);
                  return Container(
                    padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
                    margin: const EdgeInsets.fromLTRB(10, 10, 10, 0),
                    width: MediaQuery.of(context).size.width * 0.9,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        color: Colors.white),
                    child: Padding(
                      padding: const EdgeInsets.only(bottom: 10),
                      child: Row(
                        children: [
                          const SizedBox(
                            width: 10,
                          ),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                if (product != null && product.image != null)
                                  SizedBox(
                                    width: MediaQuery.of(context).size.width *
                                        0.35,
                                    child: Image.network(
                                      baseUrl + product.image!,
                                      width: 150,
                                    ),
                                  ),
                                if (product != null)
                                  Text(
                                    product.name,
                                    softWrap: true,
                                    style: const TextStyle(fontSize: 16),
                                    maxLines: 2,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                Align(
                                  alignment: Alignment.centerRight,
                                  child: Text(
                                    'x ${inDetail.count.toString()}',
                                  ),
                                ),
                                Align(
                                  alignment: Alignment.centerRight,
                                  child: Text(
                                    formattedPriceIDetails.toString(),
                                  ),
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  );
                })),
        const SizedBox(
          height: 10,
        ),
        //tổng tiền:
        Text(
          'Tổng tiền: ${formattedPriceInvoice.toString()}',
          style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
      ],
    );
  }
}
