import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ItemBottonNaBar extends StatelessWidget {
  const ItemBottonNaBar({super.key});

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      child: Container(
        height: 70,
        padding: EdgeInsets.symmetric(horizontal: 20),
        decoration: BoxDecoration(boxShadow: [
          BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 3,
              blurRadius: 10,
              offset: Offset(0, 3)),
        ]),
        child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,children: [
          Text(
            "\$120",
            style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold,
                color: Color(0xFF4C53A5)),

          )
          ,ElevatedButton.icon(onPressed: (){}, icon:Icon(CupertinoIcons.cart_badge_plus,),label: 
          Text("Add To Cart",style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold,),), style: 
          ButtonStyle(
            backgroundColor: MaterialStateProperty.all( Color(0xFF4C53A5))
           , padding: MaterialStateProperty.all(
              EdgeInsets.symmetric(horizontal: 15,vertical: 13),
              
            ),shape: MaterialStateProperty.all<RoundedRectangleBorder>(RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30)
            ))
          ),)
        ]),
      ),
    );
  }
}
