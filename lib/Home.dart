import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:mapsapp/Model/RandomUser.dart';
import 'package:mapsapp/Todos.dart';

class Home extends StatefulWidget {
  Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late List<Results> todos = [];
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
      body: FutureBuilder(
          future: initdata(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return ListView.builder(
                  itemCount: todos.length,
                  itemBuilder: (context, index) {
                    print("name" + todos[index].name.first);
                    print("lat" +
                        todos[index].location.coordinates.latitude +
                        "" +
                        "long" +
                        todos[index].location.coordinates.longitude);
                    return ListTile(
                      title: Text(todos[index].name.first),
                    );
                  });
            } else {
              return CircularProgressIndicator();
            }
          }),
    );
  }

  Future<List<Results>> initdata() async {
    var url = "https://randomuser.me/api/";
    var res = await http.get(Uri.parse(url));
    var body = json.decode(res.body);
    print(res);

    todos = RandomUser.fromJson(body).results;
    return todos;
  }
}
