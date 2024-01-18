import 'package:darkshop/views/productManagement/components/PM/cus_button.dart';
import 'package:flutter/material.dart';

class itemProduct extends StatelessWidget {
  final String name;
  final int price;
  final int id;

  itemProduct(
      {Key? key, required this.id, required this.name, required this.price})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: Colors.redAccent,
        borderRadius: BorderRadius.all(Radius.circular(20)),
      ),
      margin: const EdgeInsets.only(top: 5),
      height: MediaQuery.of(context).size.height / 5,
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Row(
          children: [
            Image.network(
              'https://product.hstatic.net/200000722513/product/pc_-_39_3f91e44cb8e342ce99ff51b9636e6e2a_1024x1024.jpg',
              cacheHeight: 80,
              fit: BoxFit.cover,
            ),
            const SizedBox(
              width: 5,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          name,
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 15,
                          ),
                        ),
                        Text(
                          price.toString(),
                          style: const TextStyle(
                            fontSize: 14,
                          ),
                        ),
                        Row(
                          children: [
                            CustomButton(
                                text: 'Sửa',
                                icon: Icons.edit,
                                onPressed: () {}),
                            const SizedBox(
                              width: 5,
                            ),
                            CustomButton(
                                text: 'Xóa',
                                icon: Icons.delete,
                                onPressed: () {}),
                          ],
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
