


import 'package:flutter/material.dart';

import '../../../provider_mode/provider_Catagory.dart';
import '../../../provider_mode/provider_product.dart';
import 'package:provider/provider.dart';

import '../../widget/customTextfor_loin_regester.dart';
import '../../widget/customeButton.dart';
class edite_product extends StatelessWidget {
  const edite_product({super.key});

  @override
  Widget build(BuildContext context) {
      final productprovider = Provider.of<product>(context);
    final catagoryprovider = Provider.of<catagroy>(context);
    return Scaffold(
        body: Padding(
            padding: const EdgeInsets.all(16.0),
            child: SafeArea(
              child: Form(
                key: productprovider.formstate_product,
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      SizedBox(
                        height: 30,
                      ),
                      custextFo_reg_log(
                        hint: 'Title of product',
                        mycontroller: productprovider.title_of_prduct,
                        vlaid: (value) {
                          if (value!.length > 300) {
                            return "title  of category can't to be larger then 300";
                          }
                          if (value.length < 2) {
                            return "title  of category can't to be less Two";
                          }
                          return null;
                        },
                      ),
                      SizedBox(height: 20),
                      Container(
                        child: SingleChildScrollView(
                          child: Container(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 10.0),
                              margin:
                                  const EdgeInsets.symmetric(horizontal: 25.0),
                              decoration: BoxDecoration(
                                  color: Colors.grey[200],
                                  border: Border.all(color: Colors.white),
                                  borderRadius: BorderRadius.circular(12)),
                              child: TextFormField(
                                  controller:
                                      productprovider.product_description,
                                  validator: (value) {
                                    if (value!.length > 200) {
                                      return "Description  can't to be larger then 100";
                                    }
                                    if (value!.length < 2) {
                                      return "Description can't to be less Two";
                                    }
                                    return null;
                                  },
                                  minLines: 1,
                                  maxLines: 10,
                                  maxLength: 200,
                                  decoration: InputDecoration(
                                    filled: true,
                                    fillColor: Colors.grey[200],
                                    hintText: 'Description',
                                    border: InputBorder.none,
                                  ))),
                        ),
                      ),
                      SizedBox(height: 20),
                      custextFo_reg_log(
                        hint: 'The price of product',
                        mycontroller: productprovider.price,
                        vlaid: (value) {
                          try {
                            double.parse(value!);
                          } catch (e) {
                            return "this filed must be numberic";
                          }
                          return null;
                        },
                      ),
                      SizedBox(height: 20),
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 10.0),
                        margin: const EdgeInsets.symmetric(horizontal: 25.0),
                        decoration: BoxDecoration(
                            color: Colors.grey[200],
                            border: Border.all(color: Colors.white),
                            borderRadius: BorderRadius.circular(12)),
                        child: FutureBuilder(
                            future: catagoryprovider.get_catagory_date(),
                            builder:
                                (BuildContext context, AsyncSnapshot snapshot) {
                              if (snapshot.hasData) {
                             
                                List tem = snapshot.data["data"];
                                List data = tem .map((dynamic item) => item as Map<String, dynamic>).toList();

                                print(tem.length);
                                return DropdownButtonFormField(
                                  hint: Text('Seclect the catagory of Product'),
                                    items: data
                                        .map((e) => DropdownMenuItem(
                                            value: e['category_id'], child: Text(e['name'])))
                                        .toList(),
                                    onChanged: (val) {
                                     productprovider.catagory=val;
                                     print(productprovider.catagory);
                                    }
                                   );
                              } else {
                                return Container();
                              }
                            }),
                      ),
                      SizedBox(height: 20),
                      if (productprovider.selectedImage != null)
                        Card(
                          color: Colors.white,
                          elevation: 2.0,
                          child: ListTile(
                              leading: Image.file(
                                productprovider.selectedImage!,
                                width: 60,
                                height: 60,
                                fit: BoxFit.cover,
                              ),
                              title: Text(productprovider.selectedImage!.path
                                  .split('/')
                                  .last),
                              trailing: IconButton(
                                icon: Icon(Icons.cancel),
                                onPressed: () {
                                  productprovider.Selcectimage(null);
                                },
                              )),
                        ),
                      SizedBox(
                        height: 20,
                      ),
                      customerButon(
                        fun: () async {
                          // await model.pickImage();
                          showModalBottomSheet(
                              context: context,
                              builder: (cont) {
                                return Container(
                                  height: 150,
                                  margin: EdgeInsets.all(10),
                                  padding: EdgeInsets.symmetric(horizontal: 10),
                                  child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Row(
                                          children: [
                                            Text(
                                              "Upload from",
                                              style: TextStyle(
                                                  fontWeight: FontWeight.w600,
                                                  fontSize: 25),
                                            )
                                          ],
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                        ),
                                        const SizedBox(
                                          height: 10,
                                        ),
                                        InkWell(
                                          onTap: () async {
                                            await productprovider
                                                .pickImage('gallery');
                                            Navigator.pop(context);
                                          },
                                          child: Container(
                                            margin: EdgeInsets.all(10),
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              children: [
                                                Icon(Icons.storage),
                                                SizedBox(
                                                  width: 30,
                                                ),
                                                Text(
                                                  "form Gallery",
                                                  style:
                                                      TextStyle(fontSize: 18),
                                                )
                                              ],
                                            ),
                                          ),
                                        ),
                                        SizedBox(
                                          height: 10,
                                        ),
                                        InkWell(
                                          onTap: () async {
                                            await productprovider
                                                .pickImage('camer');
                                            Navigator.pop(context);
                                          },
                                          child: Container(
                                            margin: EdgeInsets.all(10),
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              children: [
                                                Icon(Icons.camera),
                                                SizedBox(
                                                  width: 30,
                                                ),
                                                Text(
                                                  "form camera",
                                                  style:
                                                      TextStyle(fontSize: 18),
                                                )
                                              ],
                                            ),
                                          ),
                                        )
                                      ]),
                                );
                              });
                        },
                        tex: 'Select Image',
                        colo: Color(0xFF4C53A5),
                      ),
                      SizedBox(height: 20),
                      customerButon(
                        tex: 'update Catagory',
                        fun: () async {
                          await productprovider.edite_product(context);
                        },
                        colo: Color(0xFF4C53A5),
                      ),
                      SizedBox(height: 20),
                    ],
                  ),
                ),
              ),
            )));
  
  }
}