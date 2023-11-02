import 'package:estore/View/user/itempage.dart';
import 'package:flutter/material.dart';

import '../../constant.dart';
import '../../provider_mode/provider_cart.dart';
import '../../provider_mode/provider_product.dart';
import 'package:provider/provider.dart';

class Itemwidget extends StatelessWidget {
  const Itemwidget({super.key});

  @override
  Widget build(BuildContext context) {
    final productprovider = Provider.of<product>(context);
    final cart_prov = Provider.of<Cart>(context);
productprovider.filsdate();

 return Consumer<product>(builder: (builder,model,child){

                if(model.data_result!=null){
                  return
                      GridView.builder(
              itemCount: productprovider.data_result!.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 1,
                mainAxisSpacing: 20,
                childAspectRatio: 0.7,
              ),
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemBuilder: (BuildContext context, int index) {
                return Card(
                  color: Colors.white,
                  elevation: 3.0,
                  margin:
                      const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                  child: Container(
                    padding:
                        const EdgeInsets.only(left: 15, right: 15, top: 10),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20)),
                    child: Column(children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            padding: EdgeInsets.all(5),
                            decoration: BoxDecoration(
                                color: Color(0xFF4C53A5),
                                borderRadius: BorderRadius.circular(20)),
                            child: const Text(
                              "-50%",
                              style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white),
                            ),
                          ),
                          const Icon(Icons.favorite_border, color: Colors.red)
                        ],
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.push( context,MaterialPageRoute(builder: (context) =>  itempage(imagaeUrl:'${link_image}//${productprovider.data_result![index]['image']}' ,title: productprovider.data_result![index]['name'].toString(),)), );
                          
                        },
                        child: Container(
                            margin: const EdgeInsets.all(10),
                            child: Image.network(
                              '${link_image}//${productprovider.data_result![index]['image']}',
                              width: 120,
                              height: 120,
                            )),
                      ),
                      Container(
                        alignment: Alignment.centerLeft,
                        padding: const EdgeInsets.only(bottom: 8),
                        child: Text(
                          productprovider.data_result![index]['name'],
                          style: const TextStyle(
                              fontSize: 18,
                              color: Color(0xFF4C53A5),
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                      Expanded(
                        child: SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Text(
                            '${productprovider.data_result![index]['description']}',
                            style: const TextStyle(
                                fontSize: 15, color: Color(0xFF4C53A5)),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "\$${productprovider.data_result![index]['price']}",
                              style: const TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  color: Color(0xFF4C53A5)),
                            ),
                            InkWell(
                                onTap: () {
                                cart_prov.addItem(CartItem(productId: productprovider.data_result![index]['product_id'],
                                price:double.parse( productprovider.data_result![index]['price'].toString()),name: productprovider.data_result![index]['name'],
                                description: productprovider.data_result![index]['description'],quantity:1 ,
                                imageUrl: productprovider.data_result![index]['image']));
                                },
                                child: Icon(
                                  Icons.shopping_cart_checkout,
                                  color: Color(0xFF4C53A5),
                                ))
                          ],
                        ),
                      )
                    ]),
                  ),
                );
              },
            );
                }
                else return Center(child: CircularProgressIndicator());
                 
 }) ;
                    

      
          
  }
}
