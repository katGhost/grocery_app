import 'package:flutter/material.dart';

class GroceryItemTile extends StatelessWidget {
  final String itemName;
  final String itemPrice;
  final String imagePath; //return the egg image till all images are sorted
  final color; // color != belong to neither string, number or bool values

  const GroceryItemTile(
    {
      super.key,
      required this.itemName,
      required this.itemPrice,
      required this.imagePath,
      required this.color
    }
  );

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
