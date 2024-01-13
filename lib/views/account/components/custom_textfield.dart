import 'package:darkshop/utils/constants.dart';
import 'package:darkshop/views/account/account_presenter.dart';
import 'package:flutter/material.dart';

class CustomTextfield extends StatefulWidget {
  const CustomTextfield(
      {super.key, required this.title, required this.content});
  final String title;
  final String content;

  @override
  State<CustomTextfield> createState() => _CustomTextfieldState();
}

class _CustomTextfieldState extends State<CustomTextfield> {
  TextEditingController? txt;
  bool isEditting = false;

  @override
  void initState() {
    super.initState();

    txt = TextEditingController(text: widget.content);
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: TextField(
        controller: txt,
        readOnly: isEditting ? false : true,
        decoration: InputDecoration(
          border: const OutlineInputBorder(),
          labelText: widget.title,
          hintText: txt!.text,
          suffixIcon: widget.title != Constants.address
              ? isEditting
                  ? IconButton(
                      onPressed: () {
                        AccountPresenter().saveChange(widget.title, txt!.text,
                            () {
                          isEditting = false;
                          setState(() {});
                        });
                      },
                      icon: const Icon(Icons.check))
                  : IconButton(
                      onPressed: () {
                        setState(() {
                          isEditting = true;
                        });
                      },
                      icon: const Icon(Icons.edit))
              : IconButton(
                  onPressed: () {
                    AccountPresenter().gotoAddressManagement(context);
                  },
                  icon: const Icon(Icons.arrow_forward, color: Colors.black,)),
        ),
      ),
    );
  }
}
