import 'package:darkshop/data/models/product.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class SearchScreen extends StatefulWidget {
  SearchScreen({super.key, required this.products});
  List<Product> products = [];
  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  TextEditingController controller = TextEditingController();

  @override
  void initState() {
    super.initState();

    // getUserDetails();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: ListTile(
          title: TextField(
            controller: controller,
            decoration: const InputDecoration(
                hintText: 'Tìm kiếm', border: InputBorder.none),
            onChanged: onSearchTextChanged,
          ),
          trailing: IconButton(
            icon: const Icon(Icons.cancel),
            onPressed: () {
              controller.clear();
              onSearchTextChanged('');
            },
          ),
        ),
        elevation: 0.0,
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            child: widget.products.isNotEmpty || controller.text.isNotEmpty
                ? ListView.builder(
                    itemCount: widget.products.length,
                    itemBuilder: (context, i) {
                      return Card(
                        margin: const EdgeInsets.all(0.0),
                        child: ListTile(
                          title: Text(widget.products[i].name),
                        ),
                      );
                    },
                  )
                : ListView.builder(
                    itemCount: _history.length,
                    itemBuilder: (context, index) {
                      return Card(
                        margin: const EdgeInsets.all(0.0),
                        child: ListTile(
                          title: Text(_history[index].name),
                        ),
                      );
                    },
                  ),
          ),
        ],
      ),
    );
  }

  onSearchTextChanged(String text) async {
    widget.products.clear();
    if (text.isEmpty) {
      setState(() {});
      return;
    }

    for (var userDetail in _history) {
      if (userDetail.name.contains(text) || userDetail.name.contains(text)) {
        widget.products.add(userDetail);
      }
    }

    setState(() {});
  }
}

List<Product> _history = [];
