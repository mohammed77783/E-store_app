import 'package:estore/provider_mode/provider_product.dart';
import 'package:flutter/material.dart';

import '../../../constant.dart';
import '../../../provider_mode/provider_Catagory.dart';
import 'package:provider/provider.dart';

class show_product extends StatelessWidget {
  const show_product({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          //navbar
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
                            'Product Page',
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
                      height: 700,
                      padding: const EdgeInsets.symmetric(horizontal: 30),
                      decoration: const BoxDecoration(
                          color: Colors.white,
                          borderRadius:
                              BorderRadius.only(topLeft: Radius.circular(200))),
                      child: Consumer<product>(builder: (context, model, _) {
                        return FutureBuilder(
                            future: model.get_product_date(),
                            builder:
                                (BuildContext context, AsyncSnapshot snapshot) {
                              if (snapshot.hasData) {
                                return ListView.builder(
                                    scrollDirection: Axis.vertical,
                                    itemCount: snapshot.data['data'].length,
                                    itemBuilder:
                                        (BuildContext context, int index) {
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
                                            padding:const EdgeInsets.only(
                                              top: 66.0 + 16.0,
                                              bottom: 16.0,
                                              left: 16.0,
                                              right: 16.0,
                                            ),
                                            margin:const EdgeInsets.only(top: 66.0),
                                            decoration:  BoxDecoration(
                                              color: Colors.white,
                                              shape: BoxShape.rectangle,
                                              borderRadius:
                                                  BorderRadius.circular(16.0),
                                              boxShadow: const[
                                                BoxShadow(
                                                  color: Colors.black26,
                                                  blurRadius: 16.0,
                                                  offset:
                                                       Offset(0.0, 16.0),
                                                ),
                                              ],
                                            ),
                                            child: Column(
                                              mainAxisSize: MainAxisSize.min,
                                              children: <Widget>[const
                                                Text(
                                                  "Conformation",
                                                  style: TextStyle(
                                                      fontSize: 24.0,
                                                      fontWeight:
                                                          FontWeight.w700,
                                                      color: Colors.teal),
                                                ),
                                               const SizedBox(height: 16.0),
                                                const
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
                                                      await model.delete_Product_date(
                                                          snapshot.data['data'] [index][
                                                                  'product_id']
                                                              .toString(),
                                                          snapshot.data['data']
                                                                  [index][
                                                                  'image']
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
                                                  '${link_image}//${snapshot.data['data'][index]['image']}'),
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
                                                                          model.title_of_prduct.text =
                                          snapshot.data['data'][index]['name'];
                                          model.product_description.text =
                                          snapshot.data['data'][index]['description'];   
                                          model.price.text =  snapshot.data['data'][index]['price'].toString();   
                                          model.catagory=snapshot.data['data'][index]['category_id'];  
                                      
                                           Navigator.pushNamed(
                                          context, 'edite_product');                
                                          },
                                          child: Card(
                                            color: Colors.white,
                                            elevation: 3.0,
                                            margin:const EdgeInsets.symmetric(
                                                vertical: 10, horizontal: 10),
                                            child: Container(
                                              height: MediaQuery.of(context)
                                                      .size
                                                      .height *
                                                  0.3,
                                              padding:const EdgeInsets.only(
                                                  left: 15, right: 15, top: 10),
                                              decoration: BoxDecoration(
                                                  color: Colors.white,
                                                  borderRadius:
                                                      BorderRadius.circular(20)),
                                              child: Column(children: [
                                                Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    Container(
                                                      padding: EdgeInsets.all(5),
                                                      decoration: BoxDecoration(
                                                          color: Color(0xFF4C53A5),
                                                          borderRadius:
                                                              BorderRadius.circular(
                                                                  20)),
                                                      child:const Text(
                                                        "-50%",
                                                        style: TextStyle(
                                                            fontSize: 14,
                                                            fontWeight:
                                                                FontWeight.bold,
                                                            color: Colors.white),
                                                      ),
                                                    ),
                                                   const Icon(Icons.favorite_border,
                                                        color: Colors.red)
                                                  ],
                                                ),
                                                InkWell(
                                                  onTap: () {},
                                                  child: Container(
                                                      margin:const EdgeInsets.all(10),
                                                      child: Image.network(
                                                        '${link_image}//${snapshot.data['data'][index]['image']}',
                                                        width: 120,
                                                        height: 120,
                                                      )),
                                                ),
                                                Container(
                                                  alignment: Alignment.centerLeft,
                                                  padding:const
                                                      EdgeInsets.only(bottom: 8),
                                                  child: Text(
                                                    snapshot.data['data'][index]
                                                        ['name'],
                                                    style:const TextStyle(
                                                        fontSize: 18,
                                                        color: Color(0xFF4C53A5),
                                                        fontWeight:
                                                            FontWeight.bold),
                                                  ),
                                                ),
                                                Expanded(
                        child: SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Text(
                            '${ snapshot.data['data'][index]['description']}',
                            style: const TextStyle(
                                fontSize: 15, color: Color(0xFF4C53A5)),
                          ),
                        ),
                      ),
                                                Padding(
                                                  padding:const EdgeInsets.symmetric(
                                                      vertical: 10),
                                                  child: Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                    children: [
                                                      Text(
                                                        "\$${snapshot.data['data'][index]['price']}",
                                                        style:const TextStyle(
                                                            fontSize: 16,
                                                            fontWeight:
                                                                FontWeight.bold,
                                                            color:
                                                                Color(0xFF4C53A5)),
                                                      ),
                                                    ],
                                                  ),
                                                )
                                              ]),
                                            ),
                                          ),
                                        ),
                                      );
                                    });
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
                      })))),
        ],
      ),
    );
  }
}
