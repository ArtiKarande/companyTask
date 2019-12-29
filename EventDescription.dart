/*
Author : Arti karande
Date : 29/12/2019
Description : Company module task

This file has detailed of Pages. i have focus on UI part

*/

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class EventDescription extends StatefulWidget {
  EventDescription({Key key, this.imageUrl, this.name}) : super(key: key);
  String imageUrl, name;

  @override
  _EventDescriptionState createState() => _EventDescriptionState();
}

class _EventDescriptionState extends State<EventDescription> {
  bool click = true;

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

    return Scaffold(
      backgroundColor: Colors.grey,
      body: NestedScrollView(
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return <Widget>[
            SliverAppBar(
              expandedHeight: 200.0,
              floating: false,
              pinned: true,
              flexibleSpace: FlexibleSpaceBar(
                  centerTitle: true,
                  title: Text('India',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16.0,
                      )),
                  background: Image.network(
                    widget.imageUrl,
                    fit: BoxFit.cover,
                  )),
            ),
          ];
        },
        body: Stack(
          children: <Widget>[

            _widgetContainer(),

          ],
        ),
      ),
    );
  }

  _widgetContainer(){

    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;


    return Column(
      children: <Widget>[
        Container(
          height: h / 1.8,
          width: w,
          decoration: new BoxDecoration(
            color: Colors.black,
            borderRadius: new BorderRadius.only(
              topLeft: const Radius.circular(20.0),
              topRight: const Radius.circular(20.0),
            ),
          ),
          child: Column(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: new Container(
                  height: 5,
                  width: w / 5,
                  color: Colors.white54,
                ),
              ),

              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Image.asset('images/star.png'),
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.all(2.0),
                          child: Text(
                            'Arti Karande',
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: h / 40),
                          ),
                        ),
                        Row(
                            mainAxisAlignment:
                            MainAxisAlignment.spaceAround,
                            children: <Widget>[
                              Padding(
                                padding: const EdgeInsets.all(2.0),
                                child: Text(
                                  'Software Developer',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: h / 60),
                                ),
                              ),
                            ]),
                      ],
                    ),
                  ],
                ),
              ),

              //Follow button
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    Container(
                      height: h / 30,
                      width: w / 5,
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                            colors: [Colors.grey, Colors.grey[400]]),
                        borderRadius: BorderRadius.circular(5),
                        boxShadow: <BoxShadow>[
                          BoxShadow(
                              color: Colors.green.withOpacity(0.6),
                              offset: Offset(1.1, 1.1),
                              blurRadius: 10.0),
                        ],
                      ),
                      child: Center(
                        child: Text(
                          "Follow",
                          style: TextStyle(
                              fontSize: h / 45, color: Colors.white),
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              //second container

              Container(
                height: h / 3.1,//2.91,
                width: w,
                decoration: new BoxDecoration(
                  color: Color(0xFF302B54), //302B54
                  borderRadius: new BorderRadius.only(
                    topLeft: const Radius.circular(30.0),
                    topRight: const Radius.circular(30.0),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      /* Divider(
                                color: Colors.white54,
                                height: 0.6,
                                thickness: 2,
                              ),*/

                      Text(
                        widget.name,
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: h / 22),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment:
                          MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Text(
                              'Vikasnagar, Dehuroad Pune',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: h / 40),
                            ),
                            InkWell(
                              onTap: () {
                                _pressed();
                              },
                              child: Container(
                                child: Image.asset(
                                  liked
                                      ? 'images/dislike.png'
                                      : 'images/like.png',
                                  height: h / 20,
                                  width: h / 20,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
        SizedBox(
          height: h / 30,
        ),

        _getButton(),

      ],
    );

  }


// get ticket button
_getButton(){

  double h = MediaQuery.of(context).size.height;
  double w = MediaQuery.of(context).size.width;


  return  Container(
       height: h / 18,
       width: w / 1.5,
       child: new RaisedButton(
         color: Colors.blueAccent,
         onPressed: () {}, // _sendToServer,
         child: new Text(
           'Get ticket',
           style: TextStyle(color: Colors.white, fontSize: h / 40),
         ),
       ),
     );

}

}
