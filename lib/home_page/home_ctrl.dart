import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:zekademy_project/constants.dart';
import 'package:zekademy_project/models/user.dart';

class HomeCtrl extends GetxController {
  int activeIndex = 1;
  PageController homePageCtrl = PageController();
  List<User?> userList = [];

  Future? getUsers() async {
    var url = "https://jsonplaceholder.typicode.com/users";
    debugPrint(url);
    try {
      var response = await http.get(Uri.parse(url));
      if (response.statusCode == 200) {
        userList = [];
        for (var element in json.decode(response.body)) {
          userList.add(User.fromJson(element));
        }
        update([userListId]);
      } else {
        debugPrint('something went wrong');
      }
    } catch (e) {
      debugPrint("error in  getting users :  $e");
    }
  }
}
