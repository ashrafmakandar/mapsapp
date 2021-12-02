class FoodDart {
  late String name;
  late int quantity;
  late int price;
  FoodDart({required this.name, required this.price, required this.quantity});
}

List<FoodDart> fooditems = [
  FoodDart(name: 'assets/dosa.jpg', price: 35, quantity: 0),
  FoodDart(name: 'assets/idli.jpg', price: 25, quantity: 0),
  FoodDart(name: 'assets/pav.jpg', price: 40, quantity: 0),
  FoodDart(name: 'assets/sam.jpg', price: 15, quantity: 0),
];
