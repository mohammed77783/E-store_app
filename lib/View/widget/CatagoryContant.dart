import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import '../../constant.dart';
import '../../main.dart';
import '../../provider_mode/provider_Catagory.dart';

class CatagoryContant extends StatelessWidget {
  const CatagoryContant({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<catagroy>(builder: (context, model, _) {
      return SizedBox(
     height: 60,
        child: FutureBuilder(
          future: model.get_catagory_date()
          ,builder: (BuildContext context,AsyncSnapshot snapshot){
if(snapshot.hasData){
  return ListView.builder(
    scrollDirection :Axis.horizontal,
    itemCount: snapshot.data['data'].length,

    itemBuilder: (BuildContext context, int index) {
      return   Container(
              height: 50,
              margin: EdgeInsets.symmetric(horizontal: 10),
              padding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(20)),
              child:
                  Row(crossAxisAlignment: CrossAxisAlignment.center, children: [
                Image.network("${link_image}//${snapshot.data['data'][index]['descrip_picture']}", height: 40, width: 40),
                Text(
                  "${snapshot.data['data'][index]['name']}",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 17,
                      color: Color(0xFF4C53A5)),
                )
              ]),
            );
    },
  );
}
if(snapshot.connectionState==ConnectionState.waiting){
  return Center(child: Text("Loading ..............."),);
}
return Center(child: Text("Loading ......${shp.getInt('id')}.........2"),);

        }),
      );
    });
  }
}
