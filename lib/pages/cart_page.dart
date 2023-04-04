import 'package:flutter/material.dart';
import 'package:grocery_app/pages/home_page.dart';
import '../model/cart_model.dart';
import 'package:provider/provider.dart';
import 'package:google_fonts/google_fonts.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[50],
      appBar: AppBar(
        leading: IconButton(
          onPressed: () => Navigator.push(context, MaterialPageRoute(
            builder: (context) => const HomePage()
          )),
          icon: const Icon(Icons.arrow_back_ios_rounded)
        ),
        title: Text(
          "My Cart",
          style: GoogleFonts.notoSerif(
            letterSpacing: 0.9,
            fontWeight: FontWeight.bold
          ),
        ),
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.transparent,
        foregroundColor: Colors.black,
      ),
      body: Consumer<CartModel>(
        builder: (context, value, child) {
          return Column(
            children: [
              Expanded(
                child: ListView.builder(
                  padding: const EdgeInsets.all(12),
                  itemCount: value.cartItems.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(8),
                          boxShadow: const [
                            BoxShadow(
                              color: Colors.grey,
                              blurRadius: 2,
                              offset: Offset(2, 0)
                            )
                          ]
                        ),
                        child: ListTile(
                          leading: Image.asset(
                            value.cartItems[index][2],
                            height: 36,
                          ),
                          title: Text(value.cartItems[index][0]),
                          // ignore: prefer_interpolation_to_compose_strings
                          subtitle: Text('R' + value.cartItems[index][1]),
                          trailing: IconButton(
                            onPressed: () =>
                                Provider.of<CartModel>(context, listen: false)
                                    .removeFromCart(index),
                            icon: const Icon(Icons.delete_rounded),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),

              //Total cartItems amount and checkout button
              Padding(
                padding: const EdgeInsets.all(24),
                child: Container(
                  padding: const EdgeInsets.all(25),
                  decoration: BoxDecoration(
                    color: Colors.tealAccent[400],
                    borderRadius: BorderRadius.circular(12)
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Total Price",
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                              color: Colors.tealAccent[100]
                            ),
                          ),
                          const SizedBox(
                            height: 4,
                          ),
                          Text(
                            value.calculateTotal(),
                            style: const TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Colors.white
                            ),
                          )
                        ],
                      ),

                      // pay now button
                      Container(
                        padding: const EdgeInsets.all(12),
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.white)
                        ),
                        child: Row(
                          children: const [
                            Text(
                              "Proceed To Checkout",
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w600,
                                color: Colors.white
                              ),
                            ),
                            Icon(Icons.arrow_forward_ios_rounded,
                              size: 16,
                              color: Colors.white,
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
