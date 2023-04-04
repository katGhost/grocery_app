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
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Container(
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: color[200],
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
          // image
          Image.asset(imagePath,
          height: 64,
          ),
    
          // text, item name
          Text(itemName,
          style: const TextStyle(
            fontWeight: FontWeight.w400,
            fontSize: 16
          ),
          ),

          // button and price
          MaterialButton(
            onPressed: (){},
            color: color,
            child: Text('R $itemPrice',
            style: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold
            ),
            ),
          )

        ]),
      ),
    );
  }
}
