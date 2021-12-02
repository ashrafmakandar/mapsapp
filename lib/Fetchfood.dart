import 'package:flutter/widgets.dart';
import 'package:mapsapp/Food.dart';

class FetchFood with ChangeNotifier {
  late List<FoodDart> fooditemslist = [];
  late List<FoodDart> cartitems = [];
  getallfood() => fooditemslist;
  getcartitems() => cartitems;
  getcartitemslength() => cartitems.length;

  Fetchfood() {
    retreievefoods();
  }

  retreievefoods() {
    fooditemslist = fooditems;
  }

  incrementitem(int num) {
    fooditemslist[num].quantity++;
    cartitems.add(fooditemslist[num]);
    print(cartitems.length);
    notifyListeners();
  }

  decrement(int num) {
    fooditemslist[num].quantity--;

    cartitems.remove(fooditemslist[num]);
    print(cartitems.length);
    notifyListeners();
  }
}
