import 'package:flutter/material.dart';

class CartModel extends ChangeNotifier {
  //create a list/ array of items for sale
  final List _storeItems = [
    ["Eggs", "12.90", "lib/images/egg.png", Colors.orange],
    ["Milk", "32.40", "lib/images/milk.png", Colors.blue],
    ["Banana", "14.80", "lib/images/banana.png", Colors.yellow],
    ["Avocado", "25.00", "lib/images/avocado.png", Colors.green],
    ["Peanuts", "18.99", "lib/images/nuts.png", Colors.brown],
    ["Bacon", "37.60", "lib/images/bacon.png", Colors.red],
    
  ];

  final List _cartItems = [];

  /* ===========GETTERS=============== */
  // creating a getter for the items
  get storeItems => _storeItems;

  get cartItems => _cartItems;

  // Add items to the cart method
  void addToCart( int index ) {
    _cartItems.add(_storeItems[index]);
    //notiyf the listener, helping other widgets in the App to update the data.
    notifyListeners();
  }

  // Remove items from the cart
  void removeFromCart( int index ) {
    _cartItems.removeAt(index);
    // still call to upadate data
    notifyListeners();
  }

  // Calculate the amoutns in total in the cart
  String calculateTotal() {
    double totalCartAmount = 0;
    for (int i = 0; i < _cartItems.length; i++) {
      totalCartAmount += double.parse(_cartItems[i][1]);
    }

    return totalCartAmount.toStringAsFixed(2);
  }
}