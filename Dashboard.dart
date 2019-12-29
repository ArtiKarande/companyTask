/*
Author : Arti karande
Date : 29/12/2019
Description : Company module task

This file has bottom navigation bar
*/

import 'package:flutter/material.dart';
import 'package:task/ThirdTab.dart';
import 'package:toast/toast.dart';
import 'SecondTab.dart';
import 'FirstTab.dart';

class TabsDemoScreen extends StatefulWidget {
  TabsDemoScreen() : super();

  final String title = "Paris";

  @override
  _TabsDemoScreenState createState() => _TabsDemoScreenState();
}

class _TabsDemoScreenState extends State<TabsDemoScreen> {
  int currentTabIndex = 0;
  List<Widget> tabs = [FirstTab(), SecondTab(), ThirdTab()];

  onTapped(int index) {
    setState(() {
      currentTabIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: <Widget>[
            Text(widget.title,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 25,
                  letterSpacing: 2,
                )),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Icon(
                Icons.keyboard_arrow_down,
                size: 30,
              ),
            ),
          ],
        ),
        actions: <Widget>[
          IconButton(
            icon: Icon(
              Icons.search,
              color: Colors.white54,
            ),
            onPressed: () {

              Toast.show("You tap on Search "
                  , context,
                  duration: Toast.LENGTH_LONG, gravity: Toast.TOP);
            },
          ),
          IconButton(
            icon: Icon(
              Icons.format_indent_increase,
              color: Colors.white54,
            ),
            onPressed: () {

              Toast.show("You tap on Menu "
                  , context,
                  duration: Toast.LENGTH_LONG, gravity: Toast.TOP);
            },
          ),
        ],
      ),
      body: tabs[currentTabIndex],
      bottomNavigationBar: Theme(
        data: Theme.of(context).copyWith(
            canvasColor: Colors.black,
            splashColor: Colors.yellowAccent,
            unselectedWidgetColor: Colors.green,
            primaryColor: Colors.red,
            textTheme: Theme.of(context)
                .textTheme
                .copyWith(caption: new TextStyle(color: Colors.grey))),
        child: BottomNavigationBar(
          onTap: onTapped,
          currentIndex: currentTabIndex,
          fixedColor: Colors.white,
          items: [
            BottomNavigationBarItem(
              icon: Icon(
                Icons.account_balance,
              ),
              // backgroundColor: Colors.green,

              title: Text("Account"),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.mail),
              title: Text("Events"),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              title: Text("Dashboard"),
            )
          ],
        ),
      ),
    );
  }
}
