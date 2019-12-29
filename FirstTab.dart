/*
Author : Arti karande
Date : 29/12/2019
Description : Company module task

This file has first bottom navigation widget

In this, i have used static data of listitem.
bcoz i have tried to use firebase database but having some trouble issues with it.

*/

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:toast/toast.dart';

import 'EventDescription.dart';

class FirstTab extends StatefulWidget {

  @override
  _FirstTabState createState() => _FirstTabState();
}

class _FirstTabState extends State<FirstTab> {

  String name,image,country,fromDate,like;

  List<String> notes = ["All", "Food", "Sport", "Music","Play"];

  List<String> icons =['images/star.png','images/burger.png','images/sport.png','images/play.png','images/star.png'];
  String imgUrl = 'https://image.businessinsider.com/5550d6c1eab8ea8177915edd?width=1100&format=jpeg&auto=webp';

  bool liked = false;

  _pressed() {
    setState(() {
      liked = !liked;
    });
  }


  @override
  Widget build(BuildContext context) {

    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;


    return SafeArea(
      child: Scaffold(
       backgroundColor: Colors.black,

       body: Container(
         height: h,
         child: ListView(
           scrollDirection: Axis.vertical,

           children: <Widget>[
              Stack(
                children: <Widget>[
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[

                      SizedBox(height: h/30,),

                      _listOne(w/1, h/5),
                      _textWidget(h),
                      _listTwo(context),

                      //    _getData(),
                    ],
                  )
                ],
              ),
            ],
         ),
       ),
      ),
    );
  }

  _listTwo(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;

    return Container(
      height: h / 2,
      width: w / 0.2,
      // color: Colors.black,

      child: GestureDetector(

        onTap: (){
          Navigator.push(context, MaterialPageRoute(builder: (context)=>
              EventDescription(imageUrl:imgUrl,name:'Nocturnal and unusual visit')));

        },

        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: 5,
          itemBuilder: (context, index) {
            return Card(
              color: Colors.black,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Stack(
                      children: <Widget>[
                        ClipRRect(
                          borderRadius: new BorderRadius.circular(8.0),
                          child: Container(
                            width: w / 1.4,
                            height: h / 3,
                            decoration: new BoxDecoration(
                                shape: BoxShape.rectangle,
                                image: new DecorationImage(
                                    fit: BoxFit.fill,
                                    image: NetworkImage(imgUrl))),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: h / 3.4, left: w / 2),
                          child: //Image.asset('images/dislike.png',height: h/15,width: h/15,),

                          InkWell(
                            onTap: () {
                              _pressed();
                            },
                            child: Container(
                              child: Image.asset(
                                liked
                                    ? 'images/like.png'
                                    : 'images/dislike.png',
                                height: h / 15,
                                width: h / 15,
                              ),
                            ),
                          ),


                        ),
                      ],
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 8.0),
                      child: Text(
                        'FRI,DEC 19th - MON, DEC 27th',
                        style: TextStyle(
                          fontSize: h/65,
                          color: Colors.blueAccent,
                        ),
                      ),
                    ),
                    Text(
                      'India',
                      style: TextStyle(
                          fontSize: h/40,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Nunito'),
                    ),
                    Text(
                      'Nocturnal and unusual visit',
                      style: TextStyle(
                        fontSize: h/55,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  _textWidget(double h){
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Text(
        'Popular Events',
        style: TextStyle(
          fontSize: h/40,
          color: Colors.white,
        ),
      ),
    );

  }

  _listOne(double width,double height) {

    return Container(
      height: height/1,
      width: width,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: notes.length,
        itemBuilder: (context, pos) {
          return GestureDetector(

            onTap: (){

              Toast.show("You tap on : "+notes[pos], context,
                  duration: Toast.LENGTH_LONG, gravity: Toast.TOP);

            },

            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(

                width: width/5,
                decoration: new BoxDecoration(
                  color: Color(0xFF53565d),
                  borderRadius: new BorderRadius.only(
                    topLeft:  const  Radius.circular(40.0),
                    topRight: const  Radius.circular(40.0),
                    bottomLeft: const  Radius.circular(40.0),
                    bottomRight: const  Radius.circular(40.0),
                  ),),

                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    Image.asset(icons[pos]),
                    Text(notes[pos],style: TextStyle(color: Colors.white),),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _getData() {
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;

    return Container(
      height: 400,
      child: StreamBuilder<QuerySnapshot>(
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
              return new Text('Loading...');
            default:
              return new ListView(

                scrollDirection: Axis.horizontal,
                children: snapshot.data.documents.map((DocumentSnapshot doc) {

                  print('inlist----');
                  print(doc['name']);

                  return Card(
              //      color: Colors.black,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Stack(
                            children: <Widget>[

                      //        Image.network(doc['imageUrl'],width: 100,height: 100,),
                              Padding(
                                padding: EdgeInsets.only(top: h / 4, left: w / 2),
                                child: Icon(
                                  Icons.adjust,
                                  color: Colors.white,
                                  size: 50,
                                ),
                              ),
                            ],
                          ),
                          Padding(
                            padding: EdgeInsets.only(top: 8.0),
                            child: Text(
                              doc['fromDate'],
                              style: TextStyle(
                                fontSize: 9,
                                color: Colors.blueAccent,
                              ),
                            ),
                          ),
                          Text(
                            doc['name'],
                            style: TextStyle(
                                fontSize: 17,
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontFamily: 'Nunito'),
                          ),
                          Text(
                            doc['country'],
                            style: TextStyle(
                              fontSize: 15,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    ),
                  );

                }).toList(),
              );
          }
        },
      ),
    );
  }

}
