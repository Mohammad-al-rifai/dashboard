import 'package:dashboard/pages/account/login_data.dart';
import 'package:dashboard/pages/component/progress.dart';
import 'package:dashboard/pages/config.dart';
import 'package:dashboard/pages/provider/loading.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  bool isLoading = false;
  TextEditingController txtmobile = new TextEditingController();
  TextEditingController txtpwd = new TextEditingController();

  void login(context, load) async {
    if (!await checkConnection()) {
      Fluttertoast.showToast(
          msg: "Not Connect To Internet",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0);
    }

    if (txtpwd.text.isNotEmpty && txtmobile.text.isNotEmpty) {
      isLoading = true;
      load.add_loading();
      bool res = await loginUsers(txtmobile.text, txtpwd.text, context);
      isLoading = res;
      load.add_loading();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
      ),
      body: Directionality(
        textDirection: TextDirection.rtl,
        child: Container(
          margin: EdgeInsets.all(10.0),
          child: Column(
            children: [
              Expanded(
                  child: Form(
                child: ListView(
                  children: [
                    Container(
                      margin: EdgeInsets.only(bottom: 35.0),
                      child: Text(
                        "سجل الدخول الى حسابك من هنا",
                        style: TextStyle(fontSize: 25.0, color: Colors.red),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(bottom: 10.0),
                      padding: EdgeInsets.only(left: 20.0, right: 20.0),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(25.0),
                        color: Colors.white,
                      ),
                      child: TextFormField(
                        controller: txtmobile,
                        decoration: InputDecoration(
                          hintText: "الموبايل ",
                          border: InputBorder.none,
                        ),
                        validator: (String value) {
                          if (value.isEmpty) return " الرجاء ادخال الموبايل";
                          return "Yes";
                        },
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(bottom: 10.0),
                      padding: EdgeInsets.only(left: 20.0, right: 20.0),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(25.0),
                        color: Colors.white,
                      ),
                      child: Row(
                        children: [
                          Expanded(
                            child: TextFormField(
                              controller: txtpwd,
                              obscureText: true,
                              decoration: InputDecoration(
                                hintText: "كلمة المرور ",
                                border: InputBorder.none,
                              ),
                              validator: (String value) {
                                if (value.isEmpty || value.length < 6)
                                  return " الرجاء ادخال كلمة المرور ";
                                return "Yes";
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                    Consumer<LoadingControl>(builder: (context, load, child) {
                      return isLoading
                          ? linearProgress()
                          : MaterialButton(
                              onPressed: () {
                                login(context, load);
                              },
                              child: Container(
                                alignment: Alignment.center,
                                width: MediaQuery.of(context).size.width,
                                margin:
                                    EdgeInsets.only(bottom: 10.0, top: 25.0),
                                padding: EdgeInsets.all(5.0),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(25.0),
                                  color: Colors.red,
                                ),
                                child: Text(
                                  "دخول",
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 25.0),
                                ),
                              ),
                            );
                    })
                  ],
                ),
              )),
            ],
          ),
        ),
      ),
    );
  }
}
