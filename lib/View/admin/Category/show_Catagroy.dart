import 'package:estore/View/admin/Category/edite_category.dart';
import 'package:estore/provider_mode/provider_Catagory.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../constant.dart';

class show_Catagory extends StatelessWidget {
  const show_Catagory({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      children: [
        Container(
            decoration: BoxDecoration(
              color: Color(0xFF4C53A5),
              borderRadius: const BorderRadius.only(
                bottomRight: Radius.circular(50),
              ),
            ),
            padding: EdgeInsets.all(25),
            child: Column(
              children: [
                const SizedBox(height: 20),
                Row(
                  children: [
                    InkWell(
                      onTap: () {},
                      child: Icon(
                        Icons.sort,
                        size: 30,
                        color: Colors.white,
                      ),
                    ),
                    Padding(
                        padding: EdgeInsets.only(left: 20),
                        child: Text(
                          'Category Page',
                          style: TextStyle(
                              fontSize: 23,
                              fontWeight: FontWeight.bold,
                              color: Colors.white),
                        )),
                    Spacer(),
                    Container(
                      margin: EdgeInsets.only(top: 30),
                      child: CircleAvatar(
                        radius: 30,
                      ),
                    ),
                  ],
                ),
              ],
            )),
      
        Container(
            color: Theme.of(context).primaryColor,
            child: SingleChildScrollView(
              child: Container(
                height: 600,
                padding: const EdgeInsets.symmetric(horizontal: 30),
                decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius:
                        BorderRadius.only(topLeft: Radius.circular(200))),
                child: Consumer<catagroy>(builder: (context, model, _) {
                try {
                      return FutureBuilder(
                      future: model.get_catagory_date(),
                      builder: (BuildContext context, AsyncSnapshot snapshot) {
                        if (snapshot.hasData) {
                          return ListView.builder(
                            scrollDirection: Axis.vertical,
                            itemCount: snapshot.data['data'].length,
                            itemBuilder: (BuildContext context, int index) {
                              return Dismissible(
                                key: UniqueKey(),
                                onDismissed: (direction)async {
                                await  showDialog(
                                    context: context,
                                    builder: (BuildContext context) =>
                                   Dialog(
                                      backgroundColor: Colors.transparent,
                                      shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(10.0),
                                      ),
                                      elevation: 0.0,
                                      child: Stack(
                                        children: <Widget>[
                                          Container(
                                            padding: EdgeInsets.only(
                                              top: 66.0 + 16.0,
                                              bottom: 16.0,
                                              left: 16.0,
                                              right: 16.0,
                                            ),
                                            margin: EdgeInsets.only(top: 66.0),
                                            decoration:  BoxDecoration(
                                              color: Colors.white,
                                              shape: BoxShape.rectangle,
                                              borderRadius:
                                                  BorderRadius.circular(16.0),
                                              boxShadow: [
                                                BoxShadow(
                                                  color: Colors.black26,
                                                  blurRadius: 16.0,
                                                  offset:
                                                      const Offset(0.0, 16.0),
                                                ),
                                              ],
                                            ),
                                            child: Column(
                                              mainAxisSize: MainAxisSize.min,
                                              children: <Widget>[
                                                Text(
                                                  "Conformation",
                                                  style: TextStyle(
                                                      fontSize: 24.0,
                                                      fontWeight:
                                                          FontWeight.w700,
                                                      color: Colors.teal),
                                                ),
                                                SizedBox(height: 16.0),
                                                Text(
                                                  "There's been an unexpected error that's stopped the application.",
                                                  textAlign: TextAlign.center,
                                                  style: TextStyle(
                                                    fontSize: 16.0,
                                                  ),
                                                ),
                                                SizedBox(height: 24.0),
                                               
                                                Align(
                                                  alignment:
                                                      Alignment.bottomRight,
                                                  child: MaterialButton(
                                                    shape:
                                                        RoundedRectangleBorder(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        16.0)),
                                                    color: Colors.teal,
                                                    onPressed: () async {
                                                      await model.delete_catagory_date(
                                                          snapshot.data['data'] [index][
                                                                  'category_id']
                                                              .toString(),
                                                          snapshot.data['data']
                                                                  [index][
                                                                  'descrip_picture']
                                                              .toString(),
                                                          context);
                                                      Navigator.pop(context);
                                                    },
                                                    child: Text(
                                                      "Submit",
                                                      style: TextStyle(
                                                          color: Colors.white),
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                          Positioned(
                                            left: 24.0 + 66.0,
                                            right: 24.0 + 66.0,
                                            child: CircleAvatar(
                                              radius: 50.0,
                                              backgroundImage: NetworkImage(
                                                  '${link_image}//${snapshot.data['data'][index]['descrip_picture']}'),
                                              backgroundColor:
                                                  Colors.blueAccent,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  );
                                  
                                },
                                child: InkWell(
                                  onTap: () {
                                    model.selectedImage = null;
                                    model.id_edit =
                                        snapshot.data['data'][index];
                                    model.categoryController.text =
                                        snapshot.data['data'][index]['name'];

                                    Navigator.pushNamed(
                                        context, 'edite_category');
                                  },
                                  child: Container(
                                    height: 80,
                                    margin: EdgeInsets.symmetric(
                                        horizontal: 10, vertical: 10),
                                    padding: EdgeInsets.symmetric(
                                        vertical: 5, horizontal: 10),
                                    decoration: BoxDecoration(
                                        color: Colors.white,
                                        border: Border.all(
                                            color: Color(0xFF4C53A5),
                                            width: 2.0),
                                        borderRadius:  BorderRadius.circular(20)),
                                    child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                             Image.network(
                                              "${link_image}//${snapshot.data['data'][index]['descrip_picture']}",
                                              height: 40,
                                              width: 40),
                                          Text(
                                            "${snapshot.data['data'][index]['name']}",
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 17,
                                                color: Color(0xFF4C53A5)),
                                          )
                                        ]),
                                  ),
                                ),
                              );
                            },
                          );
                        }
                        if (snapshot.connectionState ==
                            ConnectionState.waiting) {
                          return Center(
                            child: Text("Loading ..............."),
                          );
                        }
                        return Center(
                          child: Text("Loading ...............2"),
                        );
                      });
             
                } catch (e) {
                  
                }
                return Text('there are/\'nt any category plase add some of it ');
                 }),
              ),
            )),
      ],
    ));
  }
}
