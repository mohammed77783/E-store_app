

import 'package:flutter/material.dart';

import '../component/curd.dart';
import '../constant.dart';

import 'package:image_picker/image_picker.dart';
import 'dart:io';

import '../main.dart';
class product extends ChangeNotifier{
  TextEditingController title_of_prduct = TextEditingController();
  TextEditingController product_description = TextEditingController();
  TextEditingController price = TextEditingController();
   var catagory;
var id_edit;
List? data;
  List? data_result;
  crud cur = new crud();
  GlobalKey<FormState> formstate_product = new GlobalKey();

  File? selectedImage;
 Future<void> pickImage(String type) async {
   
    if (type == 'gallery') {
      XFile? pickedImage =
          await ImagePicker().pickImage(source: ImageSource.gallery);
      if (pickedImage != null) {
        selectedImage = File(pickedImage.path);
        notifyListeners();
      }
    }
    if (type == 'camer') {
      final pickedImage =
          await ImagePicker().pickImage(source: ImageSource.camera);
      if (pickedImage != null) {
        selectedImage = File(pickedImage.path);
        notifyListeners();
      }  
    }
  }
 Selcectimage(value) {
    this.selectedImage = value;
    notifyListeners();
  }
// add function 
  
  
   addproduct(context) async {
    var formtemp = formstate_product.currentState;
    if (formtemp!.validate()) {
      if (selectedImage == null) {
        return showDialog(
            context: context,
            builder: (bilder) {
              return SimpleDialog(
                title: Text("Error"),
                children: [
                  Center(child: Text("You must selecte image to Category"))
                ],
              );
            });
      }

      var re = await cur.Postfuntionwithfile(
          add_porduct_link,
          {
            "name_of_product": title_of_prduct.text,
            'description': product_description.text,
             "category_id": catagory.toString(),
            'product_price':price.text ,
             "user_id":  shp.getInt('Id').toString(),
          },
          selectedImage!);
              
      if (re['state'] == 'succese') {
      
          title_of_prduct.text='';
           product_description.text='';
            price.text='';
             catagory='';
        selectedImage=null;
        notifyListeners();
        Navigator.pop(context);
      }
    }

    
 
  }


get_product_date() async {
    var re = await cur.postrequest(getDate_porduct_link, {
    });
    return re;
  }

filsdate() async {
    var re = await cur.postrequest(getDate_porduct_link, {
    });
    if(data_result==null){
  data= re['data'];
       data_result = data!.map((dynamic item) => item as Map<String, dynamic>).toList();
       print(data_result);
       notifyListeners();
    }
  }


delete_Product_date(product_id,image_name,context) async {

    var re = await cur.postrequest(delete_porduct_link, {
      "product_id": product_id,
      "image_name": image_name,
    });
        if (re['state'] != null) {
       return showDialog(
            context: context,
            builder: (bilder) {
              return const SimpleDialog(
                title: Text("Done"),
                
                children: [
                  Center(child: Text("The Delete Complete successfully"))
                ],

              );
            });
            Navigator.pop(context);
      }else {
        return showDialog(
            context: context,
            builder: (bilder) {
              return SimpleDialog(
                title: Text("Done"),
                
                children: [
                  Center(child: Text("There is problem with Delete Operation"))
                ],

              );
            });
        Navigator.pop(context);
      }
  }







  edite_product(context) async {
  
    var formtemp = formstate_product.currentState;
     var re ;
 if (formtemp!.validate()) {
      if (selectedImage != null) {
        notifyListeners();
        re = await cur.Postfuntionwithfile(
          udate_porduct_link,
          {
            "name_of_product": title_of_prduct.text,
            'description': product_description.text,
             "category_id": catagory.toString(),
            'product_price':price.text ,
             "user_id":   id_edit['user_id'].toString(),
               "product_id":   id_edit['product_id'].toString(),
                 "image_of_name":   id_edit['image'].toString(),
          },
          selectedImage!);
          
        if (re['state'] == 'succese') {
           title_of_prduct.text='';
           product_description.text='';
            price.text='';
             catagory='';
        selectedImage=null;
          notifyListeners();  
          Navigator.pop(context);
        }
        else{
          title_of_prduct.text='';
           product_description.text='';
            price.text='';
             catagory='';
        selectedImage=null;
             notifyListeners();
            Navigator.pop(context);
        }
    }
    else{
        notifyListeners();
        await Future.delayed(Duration(seconds: 2));
       re= await cur.postrequest(udate_porduct_link,
            {
             "name_of_product": title_of_prduct.text,
            'description': product_description.text,
             "category_id": catagory.toString(),
            'product_price':price.text ,
             "user_id":   id_edit['user_id'].toString(),
               "product_id":   id_edit['product_id'].toString(),
                 "image_of_name":   id_edit['image'].toString(),
            }
            );
              print('===============================================');
               print('no image');
  
        if (re['state'] == 'succese') {
          notifyListeners();
          title_of_prduct.text='';
           product_description.text='';
            price.text='';
             catagory='';
        selectedImage=null;
          Navigator.pop(context);
      }else{
       title_of_prduct.text='';
           product_description.text='';
            price.text='';
             catagory='';
        selectedImage=null;
          Navigator.pop(context);
      } 
    }
  }
}


search_product(String value){

  List dat = data!.map((dynamic item) => item as Map<String, dynamic>).toList();
  List searchdata=[];
  for(int i=0;i<dat.length;i++){
if(dat[i]['name'].toString().contains(value) || dat[i]['description'].toString().contains(value) ){
 searchdata.add(dat[i]);
}
  }
  
  data_result=searchdata;
  notifyListeners();
}


  
}