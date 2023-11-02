import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import '../../../constant.dart';
import '../../../provider_mode/provider_cart.dart';
class cartItemSamples extends StatelessWidget {
  const cartItemSamples({super.key});
  @override
  Widget build(BuildContext context) {
     final cart = Provider.of<Cart>(context);
    return SingleChildScrollView(
      child: Column(
        children:cart.items.map((e) =>  
          Container(
            height: 100,
            margin: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(10)),
            child: Row(
              children: [
                Radio(
                  value: "",
                  groupValue: "",
                  onChanged: (index) {},
                  activeColor: Color(0xFF4C53A5),
                  
                ),
                Container(
                  height: 70,
                  width: 70,
                  margin: EdgeInsets.only(right: 15),
                  child: Image.network("${link_image}//${e.imageUrl}"),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 10),
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "${e.name}",
                          style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Color(0xFF4C53A5)),
                        ),
                        Text(
                          "\$${e.price*e.quantity}",
                          style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: Color(0xFF4C53A5)),
                        )
                      ]),
                ),
                Spacer(),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 5),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Icon(
                        Icons.delete,
                        color: Colors.red,
                      ),
                      Row(
                        children: [
                          InkWell(
                            onTap: (){
                              if( e.quantity-1>0){
                          cart.updateQuantity(e, e.quantity-1); 
                              }
                            
                            },
                            child: Container(
                              padding: EdgeInsets.all(4),
                              decoration: BoxDecoration(
                                boxShadow: [BoxShadow(color: Colors.grey.withOpacity(0.5),
                                spreadRadius: 1,
                                blurRadius: 10)],
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(20))
                                  ,child: Icon(CupertinoIcons.minus,size: 18,),
                            ),
                          ),Container(margin: EdgeInsets.symmetric(horizontal: 10),
                          child: Text("${e.quantity}",style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold,color: Color(0xFF4C53A5)),),),
                           InkWell(onTap: (){
                              cart.updateQuantity(e, e.quantity+1);
                           },
                             child: Container(
                              padding: EdgeInsets.all(4),
                              decoration: BoxDecoration(
                                boxShadow: [BoxShadow(color: Colors.grey.withOpacity(0.5),
                                spreadRadius: 1,
                                blurRadius: 10)],
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(20))
                                  ,child: Icon(CupertinoIcons.plus,size: 18),
                                                     ),
                           )
                        ],
                      )
                    ],
                  ),
                )
              ],
            ),
          )
       ).toList(),
      ),
    );
  }
}
