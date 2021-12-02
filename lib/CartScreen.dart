import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:mapsapp/Cartprovider.dart';
import 'package:mapsapp/Fetchfood.dart';
import 'package:provider/provider.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({Key? key}) : super(key: key);

  @override
  _CartScreenState createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  late Cartprovider cart;
  @override
  void initState() {
    cart = Provider.of<Cartprovider>(context, listen: false);
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('as'),
        ),
        body: Container(
            child: Consumer<Cartprovider>(builder: (context, data, child) {
          if (data.cart.length != null) {
            return ListView.builder(
                itemCount: data.cart.length,
                itemBuilder: (context, index) {
                  return Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: Container(
                          decoration: BoxDecoration(
                              color: Colors.red,
                              borderRadius: BorderRadius.circular(20)),
                          child: Image.asset(data.cart[index].name,
                              fit: BoxFit.cover),
                        ),
                      ),
                      Text(data.cart[index].quantity.toString(),
                          style: TextStyle(fontSize: 30)),
                      Text("price : " + data.cart[index].price.toString(),
                          style: TextStyle(fontSize: 35)),
                    ],
                  );
                });
          } else {
            return Text("no data");
          }
        })));
  }
}
