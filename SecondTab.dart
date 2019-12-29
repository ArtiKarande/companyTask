/*
Author : Arti karande
Date : 29/12/2019
Description : Company module task

This file has second bottom navigation widget

In this, i have used firsbase database.. but with some lack of time this functionality has not completed.

*/



import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'dart:ui';

class SecondTab extends StatefulWidget {
  @override
  _SecondTabState createState() => _SecondTabState();
}

class _SecondTabState extends State<SecondTab> {

  String imgName = "";

  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Color(0xFF493366),
      body: SafeArea(
        child: Container(

          child: Stack(
            children: [

              Padding(
                padding: const EdgeInsets.all(8.0),
                child: _getData(),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _getData() {
    return
      StreamBuilder<QuerySnapshot>(
        stream: Firestore.instance
            .collection('events')
            .where('type', isEqualTo: 'event')

            .snapshots(),

        builder:
            (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.hasError) return new Text('Error: ${snapshot.error}');

          else if(snapshot.data != null)
          {
            int l=snapshot.data.documents.length;
            if(l==0)
              return Center(child: Image.asset("images/nodatafound.png"));
          }

          switch (snapshot.connectionState) {
            case ConnectionState.waiting:
              return new Text('Data is Loading...',style: TextStyle(color: Colors.white),);
            default:
              return new ListView(

                scrollDirection: Axis.vertical,
                children: snapshot.data.documents.map((DocumentSnapshot doc) {

                  imgName=doc['imageUrl'];

                  return GestureDetector(
                    child: Card(

                      elevation: 10.0,
                      child: new ListTile(

                        title: Text(
                          doc['name'],
                          style: TextStyle(fontSize: MediaQuery.of(context).size.height/40, color: Colors.black),
                        ),
                        subtitle: Text(
                          doc['fromDate'],
                          style: TextStyle(
                            fontSize: MediaQuery.of(context).size.height/45,

                            color: Colors.black54,
                          ),
                        ),
                      ),
                    ),
                  );
                }).toList(),
              );
          }
        },
      );
  }
}
