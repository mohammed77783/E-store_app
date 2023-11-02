


import 'package:estore/View/widget/customTextfor_loin_regester.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'dart:io';
import 'package:image_picker/image_picker.dart';
import 'package:flutter/material.dart';
import '../../../provider_mode/provider_Catagory.dart';
import '../../../provider_mode/provider_product.dart';
import '../../widget/customeButton.dart';

class add_catagroy extends StatelessWidget {
   add_catagroy({super.key});

  @override
  Widget build(BuildContext context) {
   
    
    return  Scaffold(
body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Consumer<catagroy>(builder: (context,model,_){
          return SafeArea(
            child: Form(
              key: model.formstate,
              child:model.isload? Center(child: CircularProgressIndicator(),):Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                SizedBox(height: 30,),
                custextFo_reg_log(hint: 'Title of Category',mycontroller: model.categoryController,
                vlaid: (value) {
                   if (value!.length > 300) {
                        return "title  of category can't to be larger then 300";
                      }
                      if (value.length < 2) {
                        return "title  of category can't to be less Two";
                      }
                      return null;
                },),
                SizedBox(height: 20),
                SizedBox(height: 20),
              SizedBox(height: 20),
                  if (model.selectedImage != null)
                  Card(color: Colors.white,
                elevation: 2.0,
                    child: ListTile(
                      leading: Image.file(
                        model.selectedImage!,
                        width: 60,
                        height: 60,
                        fit: BoxFit.cover,
                      ),
                      title: Text(model.selectedImage!.path.split('/').last),
                      trailing:IconButton(icon: Icon(Icons.cancel),onPressed: (){
                    model.Selcectimage(null);
                      },)
                    ),
                  ),SizedBox(height: 20,),
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
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Row(
                children: [
                  Text(
                    "Upload from",
                    style: TextStyle(fontWeight: FontWeight.w600, fontSize: 25),
                  )
                ],
                mainAxisAlignment: MainAxisAlignment.start,
              ),
              const SizedBox(
                height: 10,
              ),
              InkWell(
                onTap: () async {
               await model.pickImage('gallery');
               Navigator.pop(context);
                },
                child: Container(
                  margin: EdgeInsets.all(10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Icon(Icons.storage),
                      SizedBox(
                        width: 30,
                      ),
                      Text(
                        "form Gallery",
                        style: TextStyle(fontSize: 18),
                      )
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              InkWell(
                onTap: () async{
                await model.pickImage('camer');
                  Navigator.pop(context);
                },
                child: Container(
                  margin: EdgeInsets.all(10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Icon(Icons.camera),
                      SizedBox(
                        width: 30,
                      ),
                      Text(
                        "form camera",
                        style: TextStyle(fontSize: 18),
                      )
                    ],
                  ),
                ),
              )
            ]),
          );
        });
 






                  },
                  tex: 'Select Image'
                  ,colo:  Color(0xFF4C53A5),
                ), SizedBox(height: 20),
                customerButon(tex: 'Add Catagory',fun: ()async{
                await  model.addCatagory(context);
                },colo: Color(0xFF4C53A5),),
               
                SizedBox(height: 20),
              ],
                    ),
            ),
          );
  
        })   ),
   
    );

     }
}


