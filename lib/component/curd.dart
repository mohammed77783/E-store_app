

import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:path/path.dart';

// String _basicAuth = 'Basic ' +
//     base64Encode(utf8.encode(
//         'mohammed:moh12345'));
  
//     Map<String, String> myheaders = {
//           'authorization': _basicAuth
//         };

class crud{
 getrequest(String url) async{
    try{
var respon=await http.get(Uri.parse(url));
if(respon.statusCode==200){
  var responsBody=jsonDecode(respon.body);
  return responsBody;
}else{
   print("Erro ______________________________________________________________");
  print("Erro :${respon.statusCode}");
} }
    catch(e){ }
  }


 postrequest(String url,Map map) async{
    try{
var respon=await http.post(Uri.parse(url),body:map,
// headers:myheaders
 );
if(respon.statusCode==200){
  var responsBody=jsonDecode(respon.body);
  return responsBody;
}else{
  print("Erro :${respon.statusCode}");
}
    }
    catch(e){

    }
  }


Postfuntionwithfile(String url,Map data,File file) async{
var request=http.MultipartRequest('POST',Uri.parse(url));
var lengh=await file.length();
var streem=http.ByteStream(file.openRead());
var multipartfile=http.MultipartFile('image_name',streem,lengh,filename: basename(file.path));
// request.headers.addAll(myheaders);
request.files.add(multipartfile);
data.forEach((key, value) {
   request.fields[key]=value;

});
var myresponse=await request.send();
var response=await http.Response.fromStream(myresponse);
if(response.statusCode==200){
  return jsonDecode(response.body);
}
else{
  print('Error ${response.statusCode}');
}

}

}