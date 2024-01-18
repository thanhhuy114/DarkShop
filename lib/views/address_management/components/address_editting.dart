import 'package:flutter/material.dart';
import '../../../utils/colors.dart';
import '../address_management_presenter.dart';

class AddressEditting extends StatelessWidget {
  const AddressEditting(
      {super.key, required this.presenter});
  final AddressManagementPresenter presenter;

  @override
  Widget build(BuildContext context) {
    {
      return Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
              color: MyColors.backgroundAddress,
              borderRadius: BorderRadius.circular(5)),
          child: TextField(
            controller: presenter.txtAddress,
            decoration: InputDecoration(
                suffixIcon: IconButton(
              onPressed: presenter.updateAddressEditting,
              icon: const Icon(Icons.check),
            )),
          ),
        ),
      );
    }
  }
}
