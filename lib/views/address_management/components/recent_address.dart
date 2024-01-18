import 'package:flutter/material.dart';

import '../../../data/models/address.dart';
import '../../../utils/colors.dart';
import '../../../utils/constants.dart';

class RecentAddress extends StatelessWidget {
  const RecentAddress({super.key, required this.address});
  final Address address;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(3.0),
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
  }
}
