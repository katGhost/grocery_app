import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../components/grocery_item_tile.dart';

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
                child: GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                  ),
                  itemBuilder: ((context, index) {
                    return const GroceryItemTile();
                  }
                  ),
                ),
              ),

              //drawer and a logout button, takes user to the start page
            ]),
      ),
    );
  }
}
