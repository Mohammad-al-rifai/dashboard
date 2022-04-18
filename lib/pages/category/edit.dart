import 'package:dashboard/pages/config.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class EditCategory extends StatefulWidget {
  @override
  _EditCategoryState createState() => _EditCategoryState();
}

class _EditCategoryState extends State<EditCategory> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        backgroundColor: primaryColor,
        title: Text(
          "تعديل تصنيف ",
          style: TextStyle(fontSize: 20.0),
        ),
        centerTitle: true,
      ),
      body: Directionality(
        textDirection: TextDirection.rtl,
        child: Container(
          margin: EdgeInsets.all(10.0),
          padding: EdgeInsets.only(top: 30.0),
          child: Column(
            children: [
              Expanded(
                  child: Form(
                child: ListView(
                  children: [
                    Container(
                      margin: EdgeInsets.only(bottom: 10.0),
                      padding: EdgeInsets.only(left: 20.0, right: 20.0),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(25.0),
                        color: Colors.white,
                      ),
                      child: TextFormField(
                        decoration: InputDecoration(
                          hintText: "اسم التصنيف",
                          border: InputBorder.none,
                        ),
                        validator: (String value) {
                          if (value.isEmpty || value.length < 1)
                            return " الرجاء ادخال الاسم الكامل";
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
                      child: TextFormField(
                        decoration: InputDecoration(
                          hintText: "الاسم بالانكليزي",
                          border: InputBorder.none,
                        ),
                        validator: (String value) {
                          if (value.isEmpty ||
                              value.indexOf(".") == -1 ||
                              value.indexOf("@") == -1)
                            return " الرجاء ادخال الاسم";
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
                      child: TextFormField(
                        obscureText: true,
                        decoration: InputDecoration(
                          hintText: "الترتيب",
                          border: InputBorder.none,
                        ),
                        validator: (String value) {
                          if (value.isEmpty || value.length < 6)
                            return " الرجاء ادخال الترتيب ";
                          return "Yes";
                        },
                      ),
                    ),
                    MaterialButton(
                      onPressed: () {},
                      child: Container(
                        alignment: Alignment.center,
                        width: MediaQuery.of(context).size.width,
                        margin: EdgeInsets.only(bottom: 10.0, top: 25.0),
                        padding: EdgeInsets.all(5.0),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(25.0),
                          color: Colors.red,
                        ),
                        child: Text(
                          "حفظ",
                          style: TextStyle(color: Colors.white, fontSize: 25.0),
                        ),
                      ),
                    ),
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
