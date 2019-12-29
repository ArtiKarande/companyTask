/*
Author : Arti karande
Date : 29/12/2019
Description : Company module task

This file has third bottom navigation widget

*/

import 'package:flutter/material.dart';

class ThirdTab extends StatefulWidget {
  @override
  _ThirdTabState createState() => _ThirdTabState();
}

class _ThirdTabState extends State<ThirdTab> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child:
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text('Welcome to Dashboard !'),
      ),

    );
  }
}
