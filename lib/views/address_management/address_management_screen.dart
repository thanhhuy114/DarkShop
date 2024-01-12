import 'package:darkshop/data/models/address.dart';
import 'package:darkshop/views/address_management/components/address_card.dart';
import 'package:flutter/material.dart';

import '../../utils/colors.dart';
import '../../utils/constants.dart';

class AddressManagementScreen extends StatefulWidget {
  const AddressManagementScreen({super.key});

  @override
  State<AddressManagementScreen> createState() =>
      _AddressManagementScreenState();
}

class _AddressManagementScreenState extends State<AddressManagementScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(Constants.addressManagement),
        centerTitle: true,
        backgroundColor: MyColors.backgroundAppBar,
      ),
      body: ListView(
        children: [
          AddressCard(
              address: Address(
                  id: 1,
                  address: "1, Nguyễn Tất Thành, Quận 4, tp Hồ Chí Minh"),
              isRecentUsed: 0==0),
          AddressCard(
              address: Address(
                  id: 1,
                  address: "123, Nguyễn Tất Thành, Quận 4, tp Hồ Chí Minh"),
              isRecentUsed: 1==0),
        ],
      ),
      backgroundColor: MyColors.backgroundApp,
    );
  }
}
