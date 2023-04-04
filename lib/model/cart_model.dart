import 'package:flutter/material.dart';

class CartModel extends ChangeNotifier {
  //create a list/ array of items for sale
  final List _storeItems = [
    ["Eggs", "12.90", "lib/images/egg.png", Colors.orange],
    ["Milk", "32.40", "lib/images/egg.png", Colors.blue],
    ["Banana", "14.80", "lib/images/egg.png", Colors.yellow],
    ["Avocado", "25.00", "lib/images/egg.png", Colors.green],
    ["Peanuts", "18.99", "lib/images/egg.png", Colors.brown],
    ["Bacon", "37.60", "lib/images/egg.png", Colors.red],
    
  ];

  // creating a getter for the items
  get storeItems => _storeItems;
}