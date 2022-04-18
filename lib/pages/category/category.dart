import 'package:dashboard/pages/category/add.dart';
import 'package:dashboard/pages/category/edit.dart';
import 'package:dashboard/pages/config.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Category extends StatefulWidget {
  @override
  _CategoryState createState() => _CategoryState();
}

class _CategoryState extends State<Category> {
  var mypro = [
    {
      "pro_id": "1",
      "pro_name": "مشاوي",
      "pro_price": "100",
      "pro_qty": "3",
      "pro_image": "images/category/cat1.png"
    },
    {
      "pro_id": "2",
      "pro_name": "مشاوي",
      "pro_price": "200",
      "pro_qty": "4",
      "pro_image": "images/category/cat2.png"
    },
    {
      "pro_id": "3",
      "pro_name": "مشاوي",
      "pro_price": "300",
      "pro_qty": "5",
      "pro_image": "images/category/cat3.png"
    },
    {
      "pro_id": "4",
      "pro_name": "مشاوي",
      "pro_price": "400",
      "pro_qty": "6",
      "pro_image": "images/category/cat4.png"
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: primaryColor,
        title: Text(
          "إدارة التصنيفات",
          style: TextStyle(fontSize: 20.0),
        ),
        centerTitle: true,
      ),
      backgroundColor: Colors.grey[50],
      body: Directionality(
        textDirection: TextDirection.rtl,
        child: Container(
          margin: EdgeInsets.only(top: 0.0),
          child: ListView.builder(
              itemCount: mypro.length,
              itemBuilder: (context, index) {
                return SingleProduct(
                  pro_id: mypro[index]["pro_id"],
                  pro_name: mypro[index]["pro_name"],
                  pro_price: mypro[index]["pro_price"],
                  pro_qty: mypro[index]["pro_qty"],
                  pro_image: mypro[index]["pro_image"],
                );
              }),
        ),
      ),
      bottomNavigationBar: Container(
        height: 50.0,
        child: Column(
          children: [
            Container(
              alignment: Alignment.center,
              child: GestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => new AddCategory()));
                },
                child: Text(
                  " إضافة تصنيف جديد",
                  style: TextStyle(color: Colors.white, fontSize: 20.0),
                ),
              ),
              padding: EdgeInsets.only(left: 50.0, right: 30.0),
              height: 40.0,
              decoration: BoxDecoration(
                color: Colors.red,
                borderRadius: BorderRadius.circular(40.0),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class SingleProduct extends StatelessWidget {
  final String pro_id;
  final String pro_name;
  final String pro_price;
  final String pro_qty;
  final String pro_image;

  SingleProduct(
      {this.pro_id,
      this.pro_name,
      this.pro_price,
      this.pro_qty,
      this.pro_image});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: [
          Container(
            alignment: Alignment.topRight,
            child: Icon(
              Icons.cancel_outlined,
              color: Colors.red,
            ),
          ),
          Container(
            child: ListTile(
              title: Text(
                pro_name,
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18.0),
              ),
              subtitle: Text(pro_price),
              leading: Container(
                width: 50.0,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(pro_image),
                    fit: BoxFit.cover,
                  ),
                  shape: BoxShape.circle,
                ),
              ),
              trailing: Container(
                width: 30.0,
                child: Row(
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => new EditCategory()));
                      },
                      child: Container(
                        padding: EdgeInsets.all(5.0),
                        child: FaIcon(
                          FontAwesomeIcons.edit,
                          color: Colors.white,
                          size: 16,
                        ),
                        decoration: BoxDecoration(
                          color: Colors.red,
                          borderRadius: BorderRadius.circular(5.0),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
