import 'package:flutter/material.dart';

import '../../provider_mode/provider_cart.dart';


import '../widget/cart/CartItemSamples.dart';
import '../widget/cart/Cartbottomnavbar.dart';
import '../widget/cart/Cartnavbar.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
     
    return Scaffold(
        body: ListView(children: [
      //start of bar
      Cartnavbar(),
      Container(
        padding: EdgeInsets.only(top: 15),
        decoration: BoxDecoration(
          color: Color(0xFFEEDECF2),
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(35), topRight: Radius.circular(10)),
        ),
        child: Column(
          children: [
            cartItemSamples(),
            Container(
              margin: EdgeInsets.symmetric(vertical: 20, horizontal: 15),
              padding: EdgeInsets.all(10),
              child: Row(children: [
                Container(
                  decoration: BoxDecoration(
                      color: Color(0xFF4C53A5),
                      borderRadius: BorderRadius.circular(20)),
                  child: Icon(
                    Icons.add,
                    color: Colors.white,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  child: Text(
                    "Add Coupon Code",
                    style: TextStyle(
                        color: Color(0xFF4C53A5),
                        fontWeight: FontWeight.bold,
                        fontSize: 16),
                  ),
                )
              ]),
            )
          ],
        ),
      )
    ])
    ,bottomNavigationBar: Cartbottomnavbar(),);
  }
}
