import 'package:dashboard/pages/account/login.dart';
import 'package:flutter/material.dart';
import 'package:dashboard/pages/config.dart';
//import 'package:food_app/pages/Account/changepassword.dart';
//import 'package:food_app/pages/Account/myprofile.dart';

class MyDrawer extends StatefulWidget {
  @override
  _MyDrawerState createState() => _MyDrawerState();
}

class _MyDrawerState extends State<MyDrawer> {
  void logout(context) {
    prefs.remove(G_use_id);
    prefs.remove(G_use_name);
    prefs.remove(G_use_mobile);
    prefs.remove(G_use_image);

    prefs.clear();
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => new Login()));
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).copyWith(dividerColor: Colors.transparent);
    return Container(
      child: Drawer(
        child: Directionality(
          textDirection: TextDirection.rtl,
          child: ListView(
            children: [
              UserAccountsDrawerHeader(
                accountName: Text(
                  "Muhammad AlRifai",
                  style: TextStyle(fontSize: 20.0, color: Colors.black),
                ),
                accountEmail: Text(
                  "eng.mohammad.syria@gmail.com",
                  style: TextStyle(color: Colors.grey),
                ),
                currentAccountPicture: GestureDetector(
                  child: new CircleAvatar(
                    backgroundColor: Colors.red,
                    child: Icon(
                      Icons.person,
                      color: Colors.white,
                    ),
                  ),
                ),
                decoration: BoxDecoration(
                  color: Colors.grey[100],
                ),
              ),
              Container(
                padding: EdgeInsets.only(right: 10.0, left: 10.0),
                child: Column(
                  children: [
                    InkWell(
                      onTap: () {},
                      child: ListTile(
                        title: Text(
                          "الصفحة الرئيسية",
                          style: TextStyle(color: Colors.black, fontSize: 16.0),
                        ),
                        leading: Icon(
                          Icons.person,
                          color: Colors.red,
                        ),
                        trailing: Icon(Icons.arrow_forward_ios,
                            color: Colors.grey, size: 18),
                      ),
                    ),
                    Divider(
                      color: Colors.grey[400],
                    ),
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.only(right: 10.0, left: 10.0),
                child: Column(
                  children: [
                    InkWell(
                      onTap: () {
                        /*
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>Category()));
                        */
                      },
                      child: ListTile(
                        title: Text(
                          "قائمة التصنيفات",
                          style: TextStyle(color: Colors.black, fontSize: 16.0),
                        ),
                        leading: Icon(
                          Icons.restaurant_menu,
                          color: Colors.red,
                        ),
                        trailing: Icon(Icons.arrow_forward_ios,
                            color: Colors.grey, size: 18),
                      ),
                    ),
                    Divider(
                      color: Colors.grey[400],
                    ),
                  ],
                ),
              ),
              Theme(
                data: theme,
                child: ExpansionTile(
                  title: Text(
                    "حسابي",
                    style: TextStyle(color: Colors.black, fontSize: 18.0),
                  ),
                  children: [
                    //========================= child Account
                    Container(
                      padding: EdgeInsets.only(right: 10.0, left: 10.0),
                      child: Column(
                        children: [
                          InkWell(
                            onTap: () {
                              /*
                                Navigator.push(context, MaterialPageRoute(builder: (context)=>MyProfile()));
                                */
                            },
                            child: ListTile(
                              title: Text(
                                "تغيير الإعدادات الشخصية",
                                style: TextStyle(
                                    color: Colors.black, fontSize: 16.0),
                              ),
                              leading: Icon(
                                Icons.person,
                                color: Colors.red,
                              ),
                              trailing: Icon(Icons.arrow_forward_ios,
                                  color: Colors.grey, size: 18),
                            ),
                          ),
                          Divider(
                            color: Colors.grey[400],
                          ),
                        ],
                      ),
                    ),

                    Container(
                      padding: EdgeInsets.only(right: 10.0, left: 10.0),
                      child: Column(
                        children: [
                          InkWell(
                            onTap: () {
                              /*
                                Navigator.push(context, MaterialPageRoute(builder: (context)=>ChangePassword()));
                                */
                            },
                            child: ListTile(
                              title: Text(
                                "تغيير كلمة المرور",
                                style: TextStyle(
                                    color: Colors.black, fontSize: 16.0),
                              ),
                              leading: Icon(
                                Icons.lock_open,
                                color: Colors.red,
                              ),
                              trailing: Icon(Icons.arrow_forward_ios,
                                  color: Colors.grey, size: 18),
                            ),
                          ),
                        ],
                      ),
                    ),
                    //========================= END child Account
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.only(right: 10.0, left: 10.0),
                child: Divider(
                  color: Colors.grey[500],
                ),
              ),
              Container(
                padding: EdgeInsets.only(right: 10.0, left: 10.0),
                child: Column(
                  children: [
                    InkWell(
                      onTap: () {
                        /*
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>new Favorite()));
                      */
                      },
                      child: ListTile(
                        title: Text(
                          "قائمة المأكولات",
                          style: TextStyle(color: Colors.black, fontSize: 16.0),
                        ),
                        leading: Icon(
                          Icons.favorite,
                          color: Colors.red,
                        ),
                        trailing: Icon(Icons.arrow_forward_ios,
                            color: Colors.grey, size: 18),
                      ),
                    ),
                    Divider(
                      color: Colors.grey[400],
                    ),
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.only(right: 10.0, left: 10.0),
                child: Column(
                  children: [
                    InkWell(
                      onTap: () {
                        /*
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context)=>new Shopping()));
                            */
                      },
                      child: ListTile(
                        title: Text(
                          "طلبات الزبائن",
                          style: TextStyle(color: Colors.black, fontSize: 16.0),
                        ),
                        leading: Icon(
                          Icons.history,
                          color: Colors.red,
                        ),
                        trailing: Icon(Icons.arrow_forward_ios,
                            color: Colors.grey, size: 18),
                      ),
                    ),
                    Divider(
                      color: Colors.grey[400],
                    ),
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.only(right: 10.0, left: 10.0),
                child: Column(
                  children: [
                    InkWell(
                      onTap: () {
                        /*
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>new Tracking()));
                        */
                      },
                      child: ListTile(
                        title: Text(
                          "تتبع الطلبيات",
                          style: TextStyle(color: Colors.black, fontSize: 16.0),
                        ),
                        leading: Icon(
                          Icons.drive_eta,
                          color: Colors.red,
                        ),
                        trailing: Icon(Icons.arrow_forward_ios,
                            color: Colors.grey, size: 18),
                      ),
                    ),
                    Divider(
                      color: Colors.grey[400],
                    ),
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.only(right: 10.0, left: 10.0),
                child: Column(
                  children: [
                    InkWell(
                      onTap: () {
                        logout(context);
                      },
                      child: ListTile(
                        title: Text(
                          "تسجيل الخروج",
                          style: TextStyle(color: Colors.black, fontSize: 16.0),
                        ),
                        leading: Icon(
                          Icons.logout,
                          color: Colors.red,
                        ),
                        trailing: Icon(Icons.arrow_forward_ios,
                            color: Colors.grey, size: 18),
                      ),
                    ),
                    Divider(
                      color: Colors.grey[400],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
