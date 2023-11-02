import 'package:flutter/material.dart';
import 'package:badges/badges.dart' as badges;

import '../../main.dart';
import '../../provider_mode/provider_cart.dart';
import 'package:provider/provider.dart';
class homenavbar extends StatelessWidget {
  const homenavbar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: EdgeInsets.all(25),
      child: Row(
        children: [
          InkWell(onTap: (){
            shp.clear();
             Navigator.pushReplacementNamed(context, "login");
            
          },
            child: Icon(
              Icons.sort,
              size: 30,
              color: Color(0xFF4C53A5),
            ),
          ),
          Padding(
              padding: EdgeInsets.only(left: 20),
              child: Text(
                'DP Shop',
                style: TextStyle(fontSize: 23, fontWeight: FontWeight.bold),
              )),
          Spacer(),
          Consumer<Cart>(builder: (context,model,_){
            return Badge(
          
            backgroundColor: Colors.red,
            label: Text(
              "${model.count}",
              style: TextStyle(
                color: Colors.white,
              ),
            ),
           
            child: InkWell(
              onTap: () {
                Navigator.pushNamed(context, "CartPage"); 
              },
              child: Icon(
                Icons.shopping_bag_outlined,
                size: 30,
                color: Color(0xFF4C53A5),
              ),
            ),
          );
          }),
        ],
      ),
    );
  }
}
