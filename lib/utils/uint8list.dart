import 'dart:convert';

import 'package:flutter/services.dart';

Uint8List convertStringToUint8List(String base64String) {
  List<int> bytes = base64.decode(base64String);
  return Uint8List.fromList(bytes);
}

String convertImageToString(Uint8List uint8List) {
  String s = base64Encode(uint8List);
  return s;
}

//ví dụ: chuyển uint8list sang json
//'image': image?.isNotEmpty ?? false ? convertImageToString(image!) : "null",

//chuyển json sang uint8list
//UserModel.fromJson(Map<String, dynamic> json)
      // : image = json['image'] != null && json['image'] != "null"
      //       ? convertStringToUint8List(json['image'])
      //       : null,