import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:grocery_app/model/cart_model.dart';
import 'package:grocery_app/welcome_page.dart';
import '../components/grocery_item_tile.dart';
import 'package:provider/provider.dart';
import 'cart_page.dart';


class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      /*
         if drawer does not open and gives ERROR: Exception caught by gesture====
         ===Scaffold.of() called with a context that does not contain a Scaffold.=====
         -- Then wrap the Drawer caller/ button with a Builder.
       */
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        leading: Builder(
          builder: (context) {
            return IconButton(
              icon: const Icon(Icons.menu_rounded,
              color: Colors.black,
              ),
              onPressed: () {
                Scaffold.of(context).openDrawer();
              },
            );
          }
        ),
      ),
      drawer: Drawer(
        backgroundColor: Colors.white,
        child: Column(
          children: [
            // links to other pages (cart page, individual item view page and logout)
            const DrawerHeader(
              child: Icon(Icons.food_bank_rounded,
              color: Colors.grey,
              size: 60,
            ),
            ),

            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 25),
              child: Divider(
                color: Colors.grey,
              ),
            ),

            const Padding(
              padding: EdgeInsets.only(left: 25.0),
              child: ListTile(
                leading: Icon(Icons.home_rounded,
                  color: Colors.grey,
                  size: 24,
                ),
                title: Text('Home',
                style: TextStyle(
                  color: Colors.grey
                ),
                ),
              ),
            ),

            Padding(
              padding: const EdgeInsets.only(left: 25.0),
              child: ListTile(
                onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return const CartPage();
                })),
                leading: const Icon(Icons.shopping_bag_rounded,
                  color: Colors.grey,
                  size: 24,
                ),
                title: const Text('Cart',
                style: TextStyle(
                  color: Colors.grey
                ),
                ),
              ),
            ),

            const Spacer(), // pushes the item below to the bottom of the page

            Padding(
              padding: const EdgeInsets.only(left: 25.0, bottom: 25),
              child:  ListTile(
                onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return const WelcomePage();
                })),
                leading: const Icon(Icons.logout_rounded,
                  color: Colors.grey,
                  size: 24,
                ),
                title: const Text('Logout',
                style: TextStyle(
                  color: Colors.grey
                ),
                ),
              ),
            ),
          ],
        ),
      ),
      body: SafeArea(
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              // const SizedBox(
              //   height: 40,
              // ),
              // greeting message text
              // const Padding(
              //   padding: EdgeInsets.symmetric(horizontal: 24.0),
              //   child: Text("Good to see you sir!",
              //       style: TextStyle(
              //         fontWeight: FontWeight.w500,
              //       )),
              // ),

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
                  itemBuilder: (context, index) {
                    return GroceryItemTile(
                      itemName: value.storeItems[index][0],
                      itemPrice: value.storeItems[index][1],
                      imagePath: value.storeItems[index][2],
                      color: value.storeItems[index][3],
                      //call the addtoCart method
                      onPressed: () {
                        Provider.of<CartModel>(context, listen: false).addToCart(index);
                      }
                    );
                  },
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
