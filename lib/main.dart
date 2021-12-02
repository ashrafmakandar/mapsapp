import 'package:flutter/material.dart';
import 'package:mapsapp/CartScreen.dart';
import 'package:mapsapp/Cartprovider.dart';
import 'package:mapsapp/Fetchfood.dart';
import 'package:mapsapp/Home.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
        providers: [
          ChangeNotifierProvider<FetchFood>(
            create: (_) => FetchFood(),
            child: Home(),
          ),
          ChangeNotifierProvider<Cartprovider>(
            create: (_) => Cartprovider(),
            child: CartScreen(),
          ),
        ],
        child: new MaterialApp(
          debugShowCheckedModeBanner: false,
          home: Home(),
        )),
  );
}
