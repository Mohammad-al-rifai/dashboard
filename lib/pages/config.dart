import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:io';

const Color primaryColor = Color(0xffFF0000);
const String token = "mahfdinmhfbncmuyf251f4r1rtegdvfgcbddleo1453789cnvn";
SharedPreferences prefs;

final String path_api = 'https://192.168.43.21:80/resturant/api/';
final String path_images = 'https://192.168.43.21:80/resturant/images/';

String G_use_id_val = "";

final String G_use_id = "use_id";
final String G_use_name = "use_name";
final String G_use_mobile = "use_mobile";
final String G_use_image = "use_image";

Future<bool> checkConnection() async {
  try {
    final result = await InternetAddress.lookup("google.com");
    if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
      print("connect");
      return true;
    } else {
      print("Not Connect");
      return false;
    }
  } on SocketException catch (_) {
    print("Not Connect");
    return false;
  }
}
