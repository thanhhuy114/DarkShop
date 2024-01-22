import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../../../data/models/invoice_details.dart';
import '../../../../data/models/product2.dart';
import '../../api_service.dart';

class CardInvoiceDetail extends StatefulWidget {
  final InvoiceDetails? relatedInvoiceDetails;
  final Color itemColor;

  const CardInvoiceDetail(
      {super.key,
      required this.relatedInvoiceDetails,
      required this.itemColor});

  @override
  CardInvoiceDetailState createState() => CardInvoiceDetailState();
}

class CardInvoiceDetailState extends State<CardInvoiceDetail> {
  List<InvoiceDetails> invoiceDetails = [];
  List<Product2> products = [];
  String baseUrl =
      'https://res.cloudinary.com/dvrzyngox/image/upload/v1705543245/';

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  Future<void> fetchData() async {
    try {
      ApiService apiService = ApiService();
      List<InvoiceDetails> fetchedInvoiceDetails =
          await apiService.getAllInvoiceDetails('invoice_details');
      List<Product2> fetchedProducts =
          await apiService.getAllProducts('products');
      setState(() {
        invoiceDetails = fetchedInvoiceDetails;
        products = fetchedProducts;
      });
    } catch (e) {
      // ignore: avoid_print
      print('Failed to fetch data: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    InvoiceDetails? relatedInvoiceDetails = widget.relatedInvoiceDetails;
    Product2? relatedProduct;
    String formattedPrice = '';
    if (relatedInvoiceDetails != null) {
      for (Product2 product in products) {
        if (product.id == relatedInvoiceDetails.idProduct) {
          relatedProduct = product;
          break;
        }
      }
      if (relatedProduct != null) {
        formattedPrice = NumberFormat.currency(locale: 'vi_VN', symbol: 'VNĐ')
            .format(relatedInvoiceDetails.totalPrice);
      }
    }

    return Container(
      padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
      margin: const EdgeInsets.fromLTRB(10, 10, 10, 0),
      width: MediaQuery.of(context).size.width * 0.9,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5), color: widget.itemColor),
      child: Row(
        children: [
          if (relatedProduct != null && relatedProduct.image != null)
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.35,
              child: Image.network(
                baseUrl + relatedProduct.image!,
                width: 150,
              ),
            ),
          const SizedBox(
            width: 10,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                if (relatedProduct != null)
                  Text(
                    relatedProduct.name,
                    softWrap: true,
                    style: const TextStyle(
                      fontSize: 16,
                      // color: Colors.red, // Thay đổi màu sắc chữ
                      fontWeight: FontWeight.bold, // Làm đậm chữ
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                Align(
                  alignment: Alignment.centerRight,
                  child: Text(
                    'x${relatedInvoiceDetails?.count.toString()}',
                    style: const TextStyle(
                      fontSize: 16,
                      // color: Colors.blue, // Thay đổi màu sắc chữ
                      fontWeight: FontWeight.bold, // Làm đậm chữ
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.centerRight,
                  child: Text(
                    formattedPrice,
                    style: const TextStyle(
                      fontSize: 16,
                      // color: Colors.green, // Thay đổi màu sắc chữ
                      fontWeight: FontWeight.bold, // Làm đậm chữ
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
