import 'dart:io';

import 'package:dashboard/pages/account/login.dart';
import 'package:dashboard/pages/home/home.dart';
import 'package:dashboard/pages/provider/loading.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:splashscreen/splashscreen.dart';
import 'package:dashboard/pages/config.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  prefs = await SharedPreferences.getInstance();
  G_use_id_val = prefs.getString(G_use_id);

//=============

  HttpOverrides.global = new MyHttpOverrides();

//======================

  runApp(
    Splash(),
  );
}

class Splash extends StatefulWidget {
  @override
  _SplashState createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider<LoadingControl>(
              create: (context) => LoadingControl()),
        ],
        child: MaterialApp(
            debugShowCheckedModeBanner: false,
            home: new SplashScreen(
              seconds: 5,
              routeName: "/",
              navigateAfterSeconds:
                  G_use_id_val == null ? new Login() : new Home(),
              title: new Text(
                'مرحبا بكم في تطبيق إدارة المطعم ',
                style: new TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 25.0,
                    color: Colors.white),
              ),
              // image: new Image.network(
              //     'https://flutter.io/images/catalog-widget-placeholder.png'),
              backgroundColor: primaryColor,
              photoSize: 100.0,
              onClick: () => print("Restaurant"),
              loaderColor: Colors.green,
            )));
  }
}

// ==================================

class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext context) {
    return super.createHttpClient(context)
      ..badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
  }
}

// ==================================
