


import 'package:flutter/material.dart';

class dashnavbar extends StatelessWidget {
  const dashnavbar({super.key});

  @override
  Widget build(BuildContext context) {
    return  Container(
      decoration: BoxDecoration(
              color:Color(0xFF4C53A5),
              borderRadius: const BorderRadius.only(
                bottomRight: Radius.circular(50),
              ),
            ),
      padding: EdgeInsets.all(25),
      child: Column(children: [ const SizedBox(height: 20),
      Row(
        children: [
          InkWell(onTap: (){
             Navigator.pushReplacementNamed(context, "login");
          },
            child: Icon(
              Icons.sort,
              size: 30,
              color:Colors.white,
            ),
          ),
          Padding(
              padding: EdgeInsets.only(left: 20),
              child: Text(
                'DP Shop',
                style: TextStyle(fontSize: 23, fontWeight: FontWeight.bold,color: Colors.white),
              )),
          Spacer(),
         Container(
          margin: EdgeInsets.only(top:30),
           child: CircleAvatar(
                      radius: 30,
                  
                    ),
         ),
        ],
      ), 
      ],));
  }
}