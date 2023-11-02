// ignore_for_file: public_member_api_docs, sort_constructors_first



import 'package:flutter/material.dart';

class customerButon extends StatelessWidget {
Function()? fun;
String tex;
Color? colo;
   customerButon({
    Key? key,
    required this.fun,
    required this.tex,
    this.colo,
  }) : super(key: key);
  

  @override
  Widget build(BuildContext context) {
    return  Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: InkWell(
                    onTap:fun ,
                    child: Container(decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      color:colo,
                    ),
                    
                    padding: EdgeInsets.all(25),
                      child: Center(
                        child: Text(tex,style: TextStyle(color: 
                        Colors.white,fontWeight: FontWeight.bold,fontSize: 18,),),
                      ),
                    ),
                  ),
                );
  }
}
