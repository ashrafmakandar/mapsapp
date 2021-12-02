import 'dart:collection';

import 'package:flutter/widgets.dart';
import 'package:mapsapp/Food.dart';

class Cartprovider with ChangeNotifier {
  late List<FoodDart> cart = [];
  getitems() => cart.toSet().toList();
  HashMap<FoodDart, int> cartitems = HashMap();
  getall() => cartitems;

  addtocart(FoodDart index) {
    cart.add(index);
    cartitems[index] = index.quantity;
    notifyListeners();
  }

  removefromcart(FoodDart index) {
    cart.remove(index);

    cartitems[index] = index.quantity;
    notifyListeners();
  }
}
