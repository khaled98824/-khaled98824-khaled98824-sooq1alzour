import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:sooq1alzour/models/PageRoute.dart';
import 'package:sooq1alzour/ui/ShowImage.dart';

class ShowAd extends StatefulWidget {
  String documentId;
  int indexDocument;
  ShowAd({this.documentId, this.indexDocument});
  @override
  _ShowAdState createState() =>
      _ShowAdState(documentId: documentId, indexDocument: indexDocument);
}

DocumentSnapshot documents;
var adImagesUrl =List<dynamic>();
bool showSlider=false;

class _ShowAdState extends State<ShowAd> {
  String documentId;
  int indexDocument;
  _ShowAdState({this.documentId, this.indexDocument});

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
   getDocumentValue();
  }
  getDocumentValue()async{
        DocumentReference documentRef =Firestore.instance.collection('Ads').document(documentId);
        documents = await documentRef.get();
        adImagesUrl = documents.data['imagesUrl'];
        setState(() {
          showSlider=true;
        });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title:Text('AA')),
      body: ListView(
        children: <Widget>[
          showSlider ?CarouselSlider(
              items: adImagesUrl.map((url){
                return Builder(
                    builder: (BuildContext context){
                      return InkWell(
                        onTap: (){
                         Navigator.push(context, BouncyPageRoute(widget:ShowImage(imageUrl: url,)));
                          },
                        child: Container(
                          child:Image.network(url),
                        ),
                      );
                    });
              }).toList(),
              options: CarouselOptions(
                initialPage: 0,
                autoPlay: true,
                pauseAutoPlayOnTouch: true,
                autoPlayAnimationDuration: Duration(milliseconds: 900),
                disableCenter:false,
                height: 230
              ),):Container(),
          Text('data')
        ],
      )

    );
  }
}
