import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:sooq1alzour/Auth/Login.dart';
import 'AddNewAd.dart';
import 'Home.dart';

class MyAccount extends StatelessWidget {
  static const String id = "MyAccount";

  @override
  Widget build(BuildContext context) {
    return MyAccountF();
  }
}

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

class MyAccountF extends StatefulWidget {
  @override
  _MyAccountFState createState() => _MyAccountFState();
}

class _MyAccountFState extends State<MyAccountF> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getCurrentUserInfo();
  }

  var currentUserUid;
  getCurrentUserInfo() async {
    var currentUser = await FirebaseAuth.instance.currentUser();
    setState(() {
      currentUserUid = currentUser.uid;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Scaffold(
          backgroundColor: Colors.white,
          body: Scaffold(
            body: Material(
                child: StreamBuilder(
              stream: Firestore.instance
                  .collection('Ads')
                  .where(
                    'uid',
                    isEqualTo: currentUserUid,
                  )
                  .snapshots(),
              builder: (BuildContext context,
                  AsyncSnapshot<QuerySnapshot> snapshot) {
                if (!snapshot.hasData)
                  return Text(
                    'Loading...',
                    style: TextStyle(fontSize: 60),
                  );
                switch (snapshot.connectionState) {
                  case ConnectionState.waiting:
                    return new Text('Loading...');
                  default:
                    return Stack(
                      children: <Widget>[
                        Padding(
                            padding: EdgeInsets.only(top: 500),
                            child: ListView.builder(
                                itemCount: snapshot.data.documents.length,
                                itemBuilder: (BuildContext context, index) {
                                  return Card(
                                    child: ListTile(
                                      title: Text(
                                        snapshot.data.documents[index]
                                            ['description'],
                                        textAlign: TextAlign.right,
                                      ),
                                      onTap: () {
                                        print(currentUserUid);
                                      },
                                      trailing: Text(
                                        snapshot.data.documents[index]['name'],
                                      ),
                                      subtitle: Text(
                                        snapshot.data.documents[index]['time'],
                                      ),
                                      leading: IconButton(
                                          icon: Icon(
                                            Icons.delete,
                                            color: Colors.red,
                                            textDirection: TextDirection.ltr,
                                          ),
                                          onPressed: () async {
                                            Firestore.instance
                                                .collection('Ads')
                                                .document(snapshot
                                                    .data
                                                    .documents[index]
                                                    .documentID)
                                                .delete()
                                                .then((value) {
                                              print('delete done');
                                            });
                                          }),
                                    ),
                                  );
                                })),
                        Column(
                          children: <Widget>[
                            Padding(padding: EdgeInsets.only(top: 34)),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: <Widget>[
                                    InkWell(
                                        onTap: () async {
                                          await FirebaseAuth.instance.signOut().then((value){
                                            setState(() {
                                              snapshot.data.documents.clear() ;
                                            });
                                            Navigator.pushReplacement(context,
                                                MaterialPageRoute(builder: (context) {
                                                  return LoginScreen();
                                                }));
                                          });
                                        },
                                        child: Icon(
                                          Icons.exit_to_app,
                                          size: 26,
                                          color: Colors.deepOrange,
                                        )),
                                    Text('تسجيل خروج',style: TextStyle(
                                      fontSize: 16,
                                      fontFamily: 'AmiriQuran',
                                      height: 0.7,
                                    ),),
                                  ],
                                ),
                                Text('حسابي',
                                  style: TextStyle(
                                  fontSize: 32,
                                  fontFamily: 'AmiriQuran',
                                  height: 1,
                                ),),
                                SizedBox(width: 1,),
                                Icon(Icons.perm_identity,size: 30,color: Colors.blue,)
                              ],
                            ),
                          ],
                        ),
                      ],
                    );
                }
              },
            )),
          ),
          bottomNavigationBar: CurvedNavigationBar(
              color: Colors.red[400],
              backgroundColor: Colors.orange,
              buttonBackgroundColor: Colors.white,
              animationDuration: Duration(milliseconds: 300),
              height: 60,
              animationCurve: Curves.bounceInOut,
              index: 0,
              onTap: (index) {
                Timer(Duration(milliseconds: 300), () {
                  if (index == 0) {
                    Navigator.of(context).pushNamed(MyAccount.id);
                  } else if (index == 1) {
                    Navigator.of(context).pushNamed(AddNewAd.id);
                  } else if (index == 2) {
                    Navigator.of(context).pushNamed(Home.id);
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
            alignment: Alignment(0.9, 0.2),
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 40,horizontal: 1),
              child: Text(
                'إعلاناتي',
                style: TextStyle(
                    fontSize: 20,
                  decoration: TextDecoration.none,
                  fontFamily: 'AmiriQuran',
                  height: 0.1,
                  color: Colors.blue[900]
                ),
              ),
            )),
      ],
    );
  }
}
