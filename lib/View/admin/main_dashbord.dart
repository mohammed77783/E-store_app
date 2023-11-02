import 'package:estore/View/widget/dash_navbar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:expandable/expandable.dart';
import '../../main.dart';

class Dashbord extends StatefulWidget {
  const Dashbord({super.key});

  @override
  State<Dashbord> createState() => _DashbordState();
}

class _DashbordState extends State<Dashbord> {
  List operation=['Add','Show'];
  List naviga=[['add_product','show_product'],['Add_category','showCatagory']];
  List ico=[Icon(Icons.add),Icon(Icons.shop_two)];
   List type=['Product','Catagroy'];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        padding: EdgeInsets.zero,
        children: [
          dashnavbar(),
            Container(
            color: Theme.of(context).primaryColor,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(200)
                )
              ),
              child: Container(
                child: SizedBox(
      height: 400.0,
      child: ListView.builder(
        itemCount:type.length ,
        itemBuilder: (context,i){
          return    Container(margin: EdgeInsets.only(top: 10),
            child: Card(color: Colors.white,
              elevation: 2.0,
              child: ExpansionTile(
                title: Text(type[i]),
               backgroundColor:  Color(0xFFEEDECF2),
                children:  <Widget>[
               ListView.builder(
                 shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
                itemCount: operation.length
                ,itemBuilder: (context,index){
                  return  InkWell(
                    onTap: (){
                     
                      Navigator.pushNamed(context,naviga[i][index]);
                    },
                    child: ListTile(
                      leading:ico[index],
                      title: Text(operation[index]),
                    ),
                  );
                },
             )
                ],
              ),
            ),
          );
        }
      ),
    )
              )    ),
          ),
          const SizedBox(height: 20)
        ],
      ),
    );
 
    
     }
     itemDashboard(String title, IconData iconData, Color background) => Container(
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(10),
      boxShadow: [
        BoxShadow(
          offset: const Offset(0, 5),
          color: Theme.of(context).primaryColor.withOpacity(.2),
          spreadRadius: 2,
          blurRadius: 5
        )
      ]
    ),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: background,
            shape: BoxShape.circle,
          ),
          child: Icon(iconData, color: Colors.white)
        ),
        const SizedBox(height: 8),
        Text(title.toUpperCase(), style: Theme.of(context).textTheme.titleMedium)
      ],
    ),
  );
}
