


import 'dart:io';
import 'package:image_picker/image_picker.dart';
import 'package:flutter/material.dart';

import 'package:estore/component/curd.dart';
import '../constant.dart';
import '../main.dart';

class catagroy extends ChangeNotifier {
  File? selectedImage;

  TextEditingController categoryController = TextEditingController();
  GlobalKey<FormState> formstate = new GlobalKey();
  bool isload = false;
  crud cur = new crud();
  var id_edit;

  Selcectimage(value) {
    this.selectedImage = value;
    notifyListeners();
  }

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
  //add function

  addCatagory(context) async {
    var formtemp = formstate.currentState;
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
      isload = true;
      var re = await cur.Postfuntionwithfile(
          add_catagroylink,
          {
            "Cataname": categoryController.text,
            'user_id': shp.getInt('Id').toString()
          },
         
          selectedImage!);
               isload = false;
      if (re['state'] == 'succese') {
      
          categoryController.text='';
        selectedImage=null;
        notifyListeners();
        Navigator.pop(context);
      }
    }
  }

//getDate to category
  get_catagory_date() async {
    var re = await cur.postrequest(getDate_catagroylink, {
     
    });
    return re;
  }



  edite_category(context) async {
     isload = false;
    var formtemp = formstate.currentState;
     var re ;
 if (formtemp!.validate()) {
      if (selectedImage != null) {
        
        isload = true;
        notifyListeners();
        re = await cur.Postfuntionwithfile(udate_catagroylink,{
             "Cataname": categoryController.text,
             "category_id": id_edit['category_id'].toString(),
              "name_ofimage":id_edit['descrip_picture'].toString(),
        },selectedImage!);
      
               print('===============================================');
            print('with image');
        isload = false;
        if (re['state'] == 'succese') {
            categoryController.text='';
        selectedImage=null;
          notifyListeners();  
          Navigator.pop(context);
        }
        else{
            categoryController.text='';
        selectedImage=null;
             notifyListeners();
            Navigator.pop(context);
        }
    }
    else{
      isload = true;
        notifyListeners();
        await Future.delayed(Duration(seconds: 2));
       re= await cur.postrequest(udate_catagroylink,
            {
              "Cataname": categoryController.text,
              'category_id': id_edit['category_id'].toString(),
              'name_ofimage':id_edit['descrip_picture'],
            }
            );
              print('===============================================');
               print('no image');
        isload = false;
        if (re['state'] == 'succese') {
          notifyListeners();
          categoryController.text='';
        selectedImage=null;
          Navigator.pop(context);
      }else{
        categoryController.text='';
        selectedImage=null;
          Navigator.pop(context);
      } 
    }
  }
}


 delete_catagory_date(catagory_id,image_name,context) async {
  print("=----------------------------");
  print('catagory    ${catagory_id}  and  ${image_name}');
    var re = await cur.postrequest(delete_catagroylink, {
      "catagory_id": catagory_id,
      "image_name": image_name,
    });
    print("-----------------------------");
    print(re);
        if (re['state'] == 'succese') {
           
       return showDialog(
            context: context,
            builder: (bilder) {
              return SimpleDialog(
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

   
}
