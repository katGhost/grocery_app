import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:grocery_app/model/cart_model.dart';
import '../components/grocery_item_tile.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              const SizedBox(
                height: 40,
              ),
              // greeting message text
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 24.0),
                child: Text("Good to see you sir!",
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                    )),
              ),

              const SizedBox(
                height: 6,
              ),

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24.0),
                child: Text(
                  "Fresh items from your trusted store",
                  style: GoogleFonts.notoSerif(
                    fontSize: 36,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),

              const SizedBox(
                height: 24,
              ),

              //divider
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24.0),
                child: Divider(
                  thickness: 2,
                  color: Colors.grey[200],
                ),
              ),

              const SizedBox(
                height: 24,
              ),
              // fresh item + add
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 24.0),
                child: Text(
                  "Fresh Items",
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),

              // Grid View of which all items can be viewed
              Expanded(
                child: Consumer<CartModel>(builder: (context, value, child) {
                  return GridView.builder(
                    itemCount: value.storeItems.length,
                    padding: const EdgeInsets.all(12.0),
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      // item card == square on default, view can be changed below
                      childAspectRatio: 1 / 1.3,
                  ),
                  itemBuilder: ((context, index) {
                    return GroceryItemTile(
                      itemName: value.storeItems[index][0],
                      itemPrice: value.storeItems[index][1],
                      imagePath: value.storeItems[index][2],
                      color: value.storeItems[index][3],
                    );
                  }
                  ),
                );
                },
                ),
              ),
              //drawer and a logout button, takes user to the start page
            ]),
      ),
    );
  }
}
