import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("My App new"),
        backgroundColor: Colors.redAccent,
        centerTitle: true,
      ),
      body: Center(child: Text("data")),
    );
  }
}
