import 'package:darkshop/data/models/address.dart';
import 'package:darkshop/utils/colors.dart';
import 'package:darkshop/views/address_management/address_management_presenter.dart';
import 'package:flutter/material.dart';

class AddressCard extends StatelessWidget {
  const AddressCard(
      {super.key, required this.address, required this.presenter});
  final AddressManagementPresenter presenter;
  final Address address;

  @override
  Widget build(BuildContext context) {
    {
      return Padding(
        padding: const EdgeInsets.all(3.0),
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
                    onTap: () {
                      presenter.onEditAddress(address);
                    },
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
                    onTap: presenter.deleteAddress,
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
