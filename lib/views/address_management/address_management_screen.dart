import 'package:darkshop/views/address_management/address_management_presenter.dart';
import 'package:darkshop/views/address_management/components/address_card.dart';
import 'package:darkshop/views/address_management/components/address_editting.dart';
import 'package:darkshop/views/address_management/components/recent_address.dart';
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
  AddressManagementPresenter? presenter;

  @override
  void initState() {
    super.initState();

    AddressManagementPresenter.getListAddress().then((lst) {
      if (lst.isNotEmpty) {
        AddressManagementPresenter.getRecentAddress().then((recent) {
          presenter = AddressManagementPresenter(
              recentAddress: recent,
              lstAddress: lst,
              reload: () {
                setState(() {});
              });
        });
        setState(() {});
      }
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(Constants.addressManagement),
        centerTitle: true,
        backgroundColor: MyColors.backgroundAppBar,
      ),
      body: presenter != null
          ? ListView(
              children: [
                if(presenter!.isAdd) AddressEditting(presenter: presenter!),
                if (presenter!.recentAddress != null) 
                  RecentAddress(address: presenter!.recentAddress!),
                for (int i = 0; i < presenter!.lstAddress.length; i++)
                  AddressCard(
                    address: presenter!.lstAddress[i],
                    presenter: presenter!,
                  ),
                Padding(
                  padding: const EdgeInsets.all(3.0),
                  child: Row(
                    
                    children: [
                      GestureDetector(
                        onTap: presenter!.onAddAddress(),
                        child: Container(
                          width: MediaQuery.of(context).size.width/2,
                          height: 30,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            color: MyColors.backgroundButton,
                          ),
                          child: Row(children: const [
                            Icon(Icons.add),
                            Text(Constants.addAddress)
                          ]),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            )
          : Container(),
      backgroundColor: MyColors.backgroundApp,
    );
  }
}
