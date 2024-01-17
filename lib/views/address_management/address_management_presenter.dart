import 'package:darkshop/data/models/address.dart';
import 'package:darkshop/data/repositories/address_repository.dart';
import 'package:darkshop/views/account/account_presenter.dart';
import 'package:flutter/material.dart';

class AddressManagementPresenter {
  AddressManagementPresenter(
      {required this.recentAddress,
      required this.lstAddress,
      required this.reload});

  List<Address> lstAddress = [];
  Function reload;
  Address? recentAddress;
  Address? addressEditting;
  bool isAdd = false;
  String tempAddress = "";
  TextEditingController txtAddress = TextEditingController();

  static Future<List<Address>> getListAddress() async {
    return await AddressRepository().getListAddress();
  }

  static Future<Address> getRecentAddress() async {
    return await AddressRepository().getRecentAddress();
  }

  onAddAddress() {
    tempAddress = "";
    isAdd = false;
    reload();
  }

  onEditAddress(Address address) {
    addressEditting = address;
    reload();
  }

  addAddress() {
    AddressRepository()
        .addAddress(AccountPresenter.userLogin!.id, tempAddress)
        .then((value) {
      reload();
    });
  }

  updateAddressEditting() {
    if (addressEditting != null) {
      AddressRepository()
          .updateAddress(addressEditting!.id, tempAddress)
          .then((value) {
        reload();
      });
    }
  }

  deleteAddress(int idAddress) {
    AddressRepository().deleteAddress(idAddress).then((value) {
      reload();
    });
  }
}
