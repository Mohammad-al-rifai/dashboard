import 'dart:convert';
import 'package:dashboard/pages/home/home.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:dashboard/pages/config.dart';
import 'dart:async';

Future<bool> loginUsers(
    String use_mobile, String use_pwd, BuildContext context) async {
  String url = path_api +
      "users/login.php?use_mobile=" +
      use_mobile +
      "&use_pwd=" +
      use_pwd +
      "&token=" +
      token;

  http.Response response = await http.get(Uri.parse(url));
  if (json.decode(response.body)["code"] == "200") {
    Map arr = json.decode(response.body)["message"];
    SharedPreferences sh = await SharedPreferences.getInstance();
    sh.setString(G_use_id, arr["use_id"]);
    sh.setString(G_use_name, arr["use_name"]);
    sh.setString(G_use_image, arr["use_image"]);
    sh.setString(G_use_mobile, arr["use_mobile"]);

    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => Home()));
    print("Success");
    return true;
  } else {
    print("Failer");
    return false;
  }
}
