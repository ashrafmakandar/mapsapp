import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:mapsapp/Todos.dart';

class Home extends StatefulWidget {
  Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
 
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("My App new"),
        backgroundColor: Colors.redAccent,
        centerTitle: true,
      ),
      body: Center(
        child:Text("data")
      ),
    );
  }

}
