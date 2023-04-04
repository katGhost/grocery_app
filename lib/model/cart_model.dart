import 'package:flutter/material.dart';

class CartModel extends ChangeNotifier {
  //create a list/ array of items for sale
  final List _storeItems = [
    ["Eggs", "12.90", "lib/images/eggs.png", Colors.yellow[400]],
    ["Milk", "32.40", "lib/images/eggs.png", Colors.blue[400]],
    ["Banana", "14.80", "lib/images/eggs.png", Colors.yellow[600]],
    ["Avocado", "25.00", "lib/images/eggs.png", Colors.green[400]],
    ["Peanuts", "18.99", "lib/images/eggs.png", Colors.brown[300]],
    ["Bacon", "37.60", "lib/images/eggs.png", Colors.red[300]],
    
  ];

  // creating a getter for the items
  get storeItems => _storeItems;
}