import 'package:darkshop/data/models/address.dart';
import 'package:darkshop/utils/colors.dart';
import 'package:darkshop/utils/constants.dart';
import 'package:flutter/material.dart';

class AddressCard extends StatelessWidget {
  const AddressCard(
      {super.key, required this.address, required this.isRecentUsed});
  final Address address;
  final bool isRecentUsed;

  @override
  Widget build(BuildContext context) {
    if (isRecentUsed) {
      return Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
              color: MyColors.backgroundAddress,
              borderRadius: BorderRadius.circular(5)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                Constants.recentUsed,
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
              ),
              Text(address.address)
            ],
          ),
        ),
      );
    } else {
      return Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
              color: MyColors.backgroundAddress,
              borderRadius: BorderRadius.circular(5)),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(address.address),
              Column(
                children: [
                  GestureDetector(
                    onTap: () {},
                    child: Container(
                      decoration: BoxDecoration(
                          color: MyColors.backgroundButton,
                          borderRadius: BorderRadius.circular(5)),
                      child: const Icon(Icons.edit),
                    ),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  GestureDetector(
                    onTap: () {},
                    child: Container(
                      decoration: BoxDecoration(
                          color: MyColors.backgroundButton,
                          borderRadius: BorderRadius.circular(5)),
                      child: const Icon(Icons.delete_outline),
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      );
    }
  }
}
