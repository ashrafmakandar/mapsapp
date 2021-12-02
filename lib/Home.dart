import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:mapsapp/CartScreen.dart';
import 'package:mapsapp/Cartprovider.dart';
import 'package:mapsapp/Fetchfood.dart';
import 'package:provider/provider.dart';
import 'dart:math' as math;

class Home extends StatefulWidget {
  Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late FetchFood datas;
  late Cartprovider prov;

  @override
  void initState() {
    datas = Provider.of<FetchFood>(context, listen: false);
    prov = Provider.of<Cartprovider>(context, listen: false);
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    datas.retreievefoods();
    return Scaffold(
      appBar: AppBar(
        title: Text("My App new"),
        actions: [
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: InkWell(
              onTap: () => {
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => CartScreen())),
              },
              child: Badge(
                  badgeColor: Colors.green,
                  toAnimate: true,
                  shape: BadgeShape.circle,
                  animationType: BadgeAnimationType.scale,
                  badgeContent:
                      Consumer<FetchFood>(builder: (context, data, child) {
                    return Text(
                      data.getcartitemslength().toString(),
                      style: TextStyle(fontSize: 20, color: Colors.black),
                    );
                  }),
                  child: Padding(
                    padding: const EdgeInsets.all(1.0),
                    child: Icon(Icons.shopping_cart_sharp,
                        size: 28, color: Colors.white),
                  )),
            ),
          )
        ],
        backgroundColor: Colors.redAccent,
        centerTitle: true,
      ),
      body: Center(child: Consumer<FetchFood>(builder: (context, data, child) {
        if (data.fooditemslist != null) {
          return ListView.builder(
              itemCount: data.fooditemslist.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Card(
                    color:
                        Color((math.Random().nextDouble() * 0xFFFFFF).toInt())
                            .withOpacity(1.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(15.0),
                          child: Container(
                            decoration: BoxDecoration(
                                color: Colors.red,
                                borderRadius: BorderRadius.circular(20)),
                            child: Image.asset(data.fooditemslist[index].name,
                                fit: BoxFit.cover),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                              "price : " +
                                  data.fooditemslist[index].price.toString(),
                              style: TextStyle(fontSize: 35)),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                              height: 40,
                              width: 120,
                              decoration: BoxDecoration(
                                  color: Colors.black,
                                  border: Border(),
                                  borderRadius: BorderRadius.circular(25)),
                              margin: EdgeInsets.all(10),
                              child: IconButton(
                                  color: Colors.white,
                                  iconSize: 25,
                                  onPressed: () => {
                                        data.incrementitem(index),
                                        data.getcartitems(),
                                        print(data.getcartitems()),
                                        print(data.cartitems),
                                        prov.addtocart(
                                            data.fooditemslist[index])
                                      },
                                  icon: Icon(Icons.add)),
                            ),
                            Text(data.fooditemslist[index].quantity.toString(),
                                style: TextStyle(fontSize: 30)),
                            Container(
                              height: 40,
                              width: 120,
                              decoration: BoxDecoration(
                                  color: Colors.black,
                                  border: Border(),
                                  borderRadius: BorderRadius.circular(25)),
                              child: IconButton(
                                  color: Colors.white,
                                  iconSize: 25,
                                  onPressed: () => {
                                        data.decrement(index),
                                        data.getcartitems(),
                                        print(data.getcartitems()),
                                        print(data.cartitems),
                                        prov.removefromcart(
                                            data.fooditemslist[index])
                                      },
                                  icon: Icon(Icons.remove)),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                );
              });
        } else {
          return CircularProgressIndicator();
        }
      })),
    );
  }
}
