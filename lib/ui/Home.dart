import 'dart:async';
import 'dart:ui';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:sooq1alzour/models/AdsModel.dart';
import 'package:sooq1alzour/ui/AddNewAd.dart';
import 'package:sooq1alzour/ui/categories/Cars&MotorCycles.dart';
import 'package:sooq1alzour/ui/categories/Clothes.dart';
import 'package:sooq1alzour/ui/categories/DevicesAndElectronics.dart';
import 'package:sooq1alzour/ui/categories/EquipmentAndTrucks.dart';
import 'package:sooq1alzour/ui/categories/Farming.dart';
import 'package:sooq1alzour/ui/categories/Food.dart';
import 'package:sooq1alzour/ui/categories/Games.dart';
import 'package:sooq1alzour/ui/categories/Homes.dart';
import 'package:sooq1alzour/ui/categories/JobsAndBusiness.dart';
import 'package:sooq1alzour/ui/categories/Livestocks.dart';
import 'package:sooq1alzour/ui/categories/Mobile.dart';
import 'package:sooq1alzour/ui/categories/OccupationsAndServices.dart';
import 'SearchUi.dart';
import 'myAccount.dart';

class Home extends StatefulWidget {
  static const String id = "Home";
  @override
  _HomeState createState() => _HomeState();
}

List<AdsModel> allList = List();
var icons1 = Icons.burst_mode;
var icons2 = Icons.home;
final List<String> _listItem = [
  'assets/images/two.jpg',
  'assets/images/three.jpg',
  'assets/images/four.jpg',
  'assets/images/five.jpg',
  'assets/images/one.jpg',
  'assets/images/two.jpg',
  'assets/images/three.jpg',
  'assets/images/four.jpg',
  'assets/images/five.jpg',
];

bool categoryOrAds = true;

class _HomeState extends State<Home> {
  bool buttonPressed1 = false;
  bool buttonPressed2 = false;
  void _letsPress1() {
    setState(() {
      buttonPressed1 = true;
      buttonPressed2 = false;
      categoryOrAds = false;
    });
  }

  void _letsPress2() {
    setState(() {
      categoryOrAds = true;

      buttonPressed1 = false;
      buttonPressed2 = true;
    });
  }

  StreamSubscription<Event> _streamSubscription;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Scaffold(
          backgroundColor: Colors.white,
          body: SafeArea(
              child: Column(
            children: <Widget>[
              Padding(padding: EdgeInsets.only(top: 5)),
              Heade(),
              SizedBox(
                height: 10,
              ),
              SearchAreaDesign(),
              Padding(padding: EdgeInsets.only(top: 5)),
              Wrap(
                crossAxisAlignment: WrapCrossAlignment.center,
                alignment: WrapAlignment.spaceAround,
                children: <Widget>[
                  SizedBox(
                    width: 180,
                    child: GestureDetector(
                        // FIRST BUTTON
                        onTap: _letsPress1,
                        child: buttonPressed1
                            ? ButtonTapped(
                                icon: icons1,
                                btnState: 1,
                              )
                            : MyButton(
                                icon: icons1,
                                btnState: 1,
                              )),
                  ),
                  SizedBox(
                    width: 180,
                    child: GestureDetector(
                        // FIRST BUTTON
                        onTap: _letsPress2,
                        child: buttonPressed2
                            ? ButtonTapped(
                                icon: icons2,
                                btnState: 0,
                              )
                            : MyButton(
                                icon: icons2,
                                btnState: 0,
                              )),
                  ),
                ],
              ),
              Padding(padding: EdgeInsets.only(top: 12)),
              categoryOrAds
                  ? Expanded(
                      child: SingleChildScrollView(
                        child: Container(
                          //height: MediaQuery.of(context).size.height,
                          child: Column(
                            children: <Widget>[
                              Wrap(
                                crossAxisAlignment: WrapCrossAlignment.center,
                                alignment: WrapAlignment.spaceAround,
                                children: <Widget>[
                                  GridViewItems(
                                      text: "أجهزة - إلكترونيات",
                                      imagePath: _listItem[0],
                                      callback: () {
                                        Navigator.of(context).pushNamed(
                                            DevicesAndElectronics.id);
                                      }),
                                  GridViewItems(
                                    text: "السيارات - الدراجات",
                                    imagePath: _listItem[1],
                                    callback: () {
                                      Navigator.of(context)
                                          .pushNamed(CarsAndMotorCycles.id);
                                    },
                                  )
                                ],
                              ),
                              Wrap(
                                crossAxisAlignment: WrapCrossAlignment.center,
                                alignment: WrapAlignment.spaceAround,
                                children: <Widget>[
                                  GridViewItems(
                                    text: "الموبايل",
                                    imagePath: _listItem[2],
                                    callback: () {
                                      Navigator.of(context)
                                          .pushNamed(Mobile.id);
                                    },
                                  ),
                                  GridViewItems(
                                    text: "وظائف وأعمال",
                                    imagePath: _listItem[3],
                                    callback: () {
                                      Navigator.of(context)
                                          .pushNamed(JobsAndBusiness.id);
                                    },
                                  )
                                ],
                              ),
                              Wrap(
                                crossAxisAlignment: WrapCrossAlignment.center,
                                alignment: WrapAlignment.spaceAround,
                                children: <Widget>[
                                  GridViewItems(
                                    text: "مهن وخدمات",
                                    imagePath: _listItem[4],
                                    callback: () {
                                      Navigator.of(context)
                                          .pushNamed(OccupationsAndServices.id);
                                    },
                                  ),
                                  GridViewItems(
                                    text: "المنزل",
                                    imagePath: _listItem[5],
                                    callback: () {
                                      Navigator.of(context).pushNamed(Homes.id);
                                    },
                                  )
                                ],
                              ),
                              Wrap(
                                crossAxisAlignment: WrapCrossAlignment.center,
                                alignment: WrapAlignment.spaceAround,
                                children: <Widget>[
                                  GridViewItems(
                                    text: "المعدات والشاحنات",
                                    imagePath: _listItem[6],
                                    callback: () {
                                      Navigator.of(context)
                                          .pushNamed(EquipmentAndTrucks.id);
                                    },
                                  ),
                                  GridViewItems(
                                    text: "المواشي",
                                    imagePath: _listItem[8],
                                    callback: () {
                                      Navigator.of(context)
                                          .pushNamed(Livestock.id);
                                    },
                                  )
                                ],
                              ),
                              Wrap(
                                crossAxisAlignment: WrapCrossAlignment.center,
                                alignment: WrapAlignment.spaceAround,
                                children: <Widget>[
                                  GridViewItems(
                                    text: "الزراعة",
                                    imagePath: _listItem[6],
                                    callback: () {
                                      Navigator.of(context)
                                          .pushNamed(Farming1.id);
                                    },
                                  ),
                                  GridViewItems(
                                    text: "ألعاب",
                                    imagePath: _listItem[8],
                                    callback: () {
                                      Navigator.of(context).pushNamed(Games.id);
                                    },
                                  )
                                ],
                              ),
                              Wrap(
                                crossAxisAlignment: WrapCrossAlignment.center,
                                alignment: WrapAlignment.spaceAround,
                                children: <Widget>[
                                  GridViewItems(
                                    text: "ألبسة",
                                    imagePath: _listItem[6],
                                    callback: () {
                                      Navigator.of(context)
                                          .pushNamed(Clothes.id);
                                    },
                                  ),
                                  GridViewItems(
                                    text: "أطعمة",
                                    imagePath: _listItem[8],
                                    callback: () {
                                      Navigator.of(context).pushNamed(Food.id);
                                    },
                                  )
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    )
                  : Expanded(
                      child: Container(
                          child: Padding(
                      padding: EdgeInsets.only(top: 12),
                      child: Stack(
                        children: <Widget>[
                          Padding(
                            padding: EdgeInsets.symmetric(
                                vertical: 28, horizontal: 10),
                            child: Align(
                              alignment: Alignment(-1, -1.2),
                              child: Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(6),
                                  color: Colors.redAccent,
                                ),
                                width: 60,
                                height: 30,
                              ),
                            ),
                          ),
                          Align(
                            alignment: Alignment(1, -1.1),
                            child: Padding(
                              padding: EdgeInsets.symmetric(
                                  vertical: 1, horizontal: 2),
                              child: Card(
                                child: Padding(
                                  padding: EdgeInsets.only(
                                      bottom: 6, top: 10, right: 30, left: 30),
                                  child: Text(
                                    'أحدث الإعلانات',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        fontSize: 22,
                                        fontFamily: 'AmiriQuran',
                                        height: 1),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Padding(
                              padding: EdgeInsets.only(top: 30),
                              child: AllAds()),
                        ],
                      ),
                    ))),
            ],
          )),
          bottomNavigationBar: CurvedNavigationBar(
              color: Colors.red[500],
              backgroundColor: Colors.orange,
              buttonBackgroundColor: Colors.white,
              animationDuration: Duration(milliseconds: 300),
              height: 66,
              animationCurve: Curves.bounceInOut,
              index: 2,
              onTap: (index) {
                Timer(Duration(milliseconds: 300), () {
                  if (index == 0) {
                    Navigator.of(context).pushNamed(MyAccount.id);
                  } else if (index == 1) {
                    Navigator.of(context).pushNamed(AddNewAd.id);
                  }
                });
              },
              items: <Widget>[
                Icon(
                  Icons.person,
                  color: Colors.blue[900],
                  size: 29,
                ),
                Icon(
                  Icons.add_photo_alternate,
                  color: Colors.blue[900],
                  size: 31,
                ),
                Icon(
                  Icons.home,
                  color: Colors.blue[900],
                  size: 29,
                ),
              ]),
        ),
        Align(
          alignment: Alignment(1, 1),
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 10, horizontal: 48),
            child: Text(
              'الرئيسية',
              style: TextStyle(
                  fontSize: 15,
                  color: Colors.white,
                  decoration: TextDecoration.none,
                  fontFamily: 'AmiriQuran',
                  height: 1),
            ),
          ),
        ),
        Align(
          alignment: Alignment(-1, 1),
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 10, horizontal: 53),
            child: Text(
              'حسابي',
              style: TextStyle(
                  fontSize: 15,
                  color: Colors.white,
                  decoration: TextDecoration.none,
                  fontFamily: 'AmiriQuran',
                  height: 1),
            ),
          ),
        ),
        Align(
          alignment: Alignment(-0.1, 1),
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 10, horizontal: 40),
            child: Text(
              'أضف إعلان',
              style: TextStyle(
                  fontSize: 16,
                  color: Colors.white,
                  decoration: TextDecoration.none,
                  fontFamily: 'AmiriQuran',
                  height: 1),
            ),
          ),
        ),
      ],
    );
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }
}

Widget Heade() {
  return Column(
    children: <Widget>[
      Container(
          child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Text(
            '  سوق الزور',
            style: TextStyle(
              color: Colors.black,
              fontSize: 28,
              fontFamily: 'AmiriQuran',
              height: 1,
            ),
          ),
          Padding(
            padding: EdgeInsets.only(right: 3),
            child: Container(
              width: 80,
              height: 40,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(14),
                color: Colors.blue,
              ),
            ),
          )
        ],
      )),
    ],
  );
}

class SearchAreaDesign extends StatefulWidget {
  @override
  _SearchAreaDesignState createState() => _SearchAreaDesignState();
}

class _SearchAreaDesignState extends State<SearchAreaDesign> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.of(context).pushNamed(SearchUi.id);
      },
      child: Padding(
        padding: EdgeInsets.only(right: 10, left: 10),
        child: Container(
          height: 42,
          width: 340,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(40), color: Colors.grey[350]),
          child: Stack(
            textDirection: TextDirection.rtl,
            alignment: Alignment(0.3, 0),
            children: <Widget>[
              Text('!... إبحث في سوق الزور',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 22,
                    fontFamily: 'AmiriQuran',
                    height: 1,
                  )),
              Align(
                  alignment: Alignment(0.9, 0),
                  child: Icon(
                    Icons.search,
                    size: 32,
                  ))
            ],
          ),
        ),
      ),
    );
  }
}

class ButtonTapped extends StatelessWidget {
  var icon;
  int btnState;

  ButtonTapped({Key key, this.icon, this.btnState}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(6),
      child: Container(
        padding: EdgeInsets.all(5),
        child: Container(
          width: 90,
          height: 55,
          //padding: EdgeInsets.all(16),
          child: Wrap(
            children: <Widget>[
              Align(
                alignment: Alignment(0.9, 0),
                child: Icon(
                  icon,
                  size: 32,
                  color: Colors.redAccent[700],
                  textDirection: TextDirection.rtl,
                ),
              ),
              Align(
                alignment: Alignment(-0.2, 0),
                child: btnState == 1
                    ? Text(
                        'الإعلانات',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 30,
                          fontFamily: 'AmiriQuran',
                          height: 0.3,
                        ),
                      )
                    : Text(
                        'الأقسام',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 28,
                          fontFamily: 'AmiriQuran',
                          height: 0.2,
                        ),
                      ),
              )
            ],
          ),

          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.grey[300],
              boxShadow: [
                BoxShadow(
                    color: Colors.white,
                    offset: Offset(4.0, 4.0),
                    spreadRadius: 3.0),
                BoxShadow(
                  color: Colors.grey[600],
                  offset: Offset(-4.0, -4.0),
                  blurRadius: 1.0,
                  spreadRadius: 1.0,
                ),
              ],
              gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [
                    Colors.grey[700],
                    Colors.grey[600],
                    Colors.grey[500],
                    Colors.grey[200],
                  ],
                  stops: [
                    0,
                    0.1,
                    0.3,
                    1
                  ])),
        ),
        decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.grey[300],
            boxShadow: [
              BoxShadow(
                  color: Colors.white,
                  offset: Offset(-4.0, -4.0),
                  blurRadius: 15.0,
                  spreadRadius: 1.0),
            ],
            gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  Colors.grey[200],
                  Colors.grey[300],
                  Colors.grey[400],
                  Colors.grey[500],
                ],
                stops: [
                  0.1,
                  0.3,
                  0.8,
                  1
                ])),
      ),
    );
  }
}

class MyButton extends StatelessWidget {
  var icon;
  int btnState;

  MyButton({Key key, this.icon, this.btnState}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(6),
      child: Container(
        width: 70,
        height: 55,
        padding: EdgeInsets.all(1),
        child: Wrap(
          children: <Widget>[
            Align(
              alignment: Alignment(0.9, 0),
              child: Icon(
                icon,
                size: 34,
                color: Colors.blueAccent[700],
                textDirection: TextDirection.rtl,
              ),
            ),
            Align(
              alignment: Alignment(-0.2, 0),
              child: btnState == 1
                  ? Padding(
                      padding: EdgeInsets.only(bottom: 3),
                      child: Text(
                        'الإعلانات',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 30,
                          fontFamily: 'AmiriQuran',
                          height: 0.1,
                        ),
                      ),
                    )
                  : Padding(
                      padding: EdgeInsets.only(bottom: 5),
                      child: Text(
                        'الأقسام',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 28,
                          fontFamily: 'AmiriQuran',
                          height: 0.1,
                        ),
                      ),
                    ),
            )
          ],
        ),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Colors.grey[300],
            boxShadow: [
              BoxShadow(
                  color: Colors.grey[600],
                  offset: Offset(4.0, 4.0),
                  blurRadius: 15.0,
                  spreadRadius: 1.0),
              BoxShadow(
                  color: Colors.white,
                  offset: Offset(-4.0, -4.0),
                  blurRadius: 15.0,
                  spreadRadius: 1.0),
            ],
            gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  Colors.grey[200],
                  Colors.grey[300],
                  Colors.grey[400],
                  Colors.grey[500],
                ],
                stops: [
                  0.1,
                  0.3,
                  0.8,
                  1
                ])),
      ),
    );
  }
}

class GridViewItems extends StatelessWidget {
  final String text;
  final VoidCallback callback;
  final String imagePath;

  GridViewItems({
    Key key,
    this.text,
    this.callback,
    this.imagePath,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: callback,
      child: Card(
        elevation: 0,
        color: Colors.white,
        child: SizedBox(
          width: 190,
          height: 200,
          child: Container(
            width: 100,
            //width: double.infinity,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              image: DecorationImage(
                  image: AssetImage(imagePath), fit: BoxFit.cover),
              color: Colors.redAccent,
            ),
            child: Transform.translate(
                offset: Offset(22, -72),
                child: Container(
                    margin: EdgeInsets.symmetric(horizontal: 27, vertical: 82),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.white),
                    child: Center(
                      child: Text(
                        text,
                        textAlign: TextAlign.center,
                        textDirection: TextDirection.rtl,
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 18,
                          fontFamily: 'AmiriQuran',
                          height: 0.5,
                        ),
                      ),
                    ))),
          ),
        ),
      ),
    );
  }
}

class AllAds extends StatefulWidget {
  @override
  _AllAdsState createState() => _AllAdsState();
}

String department;
String category;

class _AllAdsState extends State<AllAds> {
  @override
  Widget build(BuildContext context) {
    return Material(
        child: StreamBuilder(
            stream: Firestore.instance
                .collection('Ads')
                .where(
                  'department',
                  isEqualTo: department,
                )
                .where('category', isEqualTo: category)
                .snapshots(),
            builder:
                (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
              if (!snapshot.hasData)
                return Text(
                  'Loading...',
                  style: TextStyle(fontSize: 60),
                );
              switch (snapshot.connectionState) {
                case ConnectionState.waiting:
                  return new Text('Loading...');
                 default:
                  return Container(
                    child: new GridView.count(
                      crossAxisCount: 2,
                      crossAxisSpacing: 5,
                      mainAxisSpacing: 5,
                      childAspectRatio: 0.7,
                      children: List.generate(10, (index) {
                        return InkWell(
                          onTap: () {
                            print(index);
                          },
                          child: Card(
                            elevation: 6,
                            child: Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: Colors.white70,
                                ),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: <Widget>[
                                    ClipRRect(
                                      child: Image.network(
                                        snapshot.data.documents[index]['image1'],
                                        height: 214,
                                        width: 190,
                                        fit: BoxFit.fill,
                                      ),
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    SizedBox(
                                      height: 5,
                                    ),
                                    Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.end,
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: <Widget>[
                                        Text(
                                          snapshot.data.documents[index]['name'],
                                          style: TextStyle(
                                            fontSize: 15,
                                            fontFamily: 'AmiriQuran',
                                            height: 1.2,
                                          ),
                                        ),
                                        SizedBox(
                                          width: 5,
                                        ),
                                      ],
                                    ),
                                    SizedBox(
                                      height: 4,
                                    ),
                                    Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.end,
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: <Widget>[
                                        Text(
                                          snapshot.data.documents[index]['price'].toString(),
                                          style: TextStyle(
                                            fontSize: 14,
                                            fontFamily: 'AmiriQuran',
                                            height: 1.2,
                                          ),
                                        ),
                                        SizedBox(
                                          width: 3,
                                        ),
                                        Text(
                                          ': السعر',
                                          style: TextStyle(
                                            fontSize: 14,
                                            fontFamily: 'AmiriQuran',
                                            height: 1.2,
                                          ),
                                        ),
                                      ],
                                    ),
                                    Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.end,
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: <Widget>[
                                        Text(
                                          snapshot.data.documents[index]['area'],
                                          style: TextStyle(
                                            fontSize: 14,
                                            fontFamily: 'AmiriQuran',
                                            height: 1.2,
                                          ),
                                        ),
                                        SizedBox(
                                          width: 3,
                                        ),
                                        Text(
                                          ': المنطقة',
                                          style: TextStyle(
                                            fontSize: 14,
                                            fontFamily: 'AmiriQuran',
                                            height: 1.3,
                                          ),
                                        ),
                                        SizedBox(
                                          width: 9,
                                        )
                                      ],
                                    ),
                                  ],
                                )),
                          ),
                        );
                      }),
                    ),
                  );
              }
            }));
  }
}
