// ignore_for_file: public_member_api_docs, sort_constructors_first



import 'package:flutter/material.dart';

class custextFo_reg_log extends StatelessWidget {
  String hint;
  TextEditingController mycontroller;
   FormFieldValidator<String>? vlaid;
   custextFo_reg_log({
    Key? key,
    required this.hint,
    required this.mycontroller,
    this.vlaid
  }) : super(key: key);
 

  @override
  Widget build(BuildContext context) {
    return   Container(
                      padding: const EdgeInsets.symmetric(horizontal: 10.0),
                      margin: const EdgeInsets.symmetric(horizontal: 25.0),
                    
                      decoration: BoxDecoration(
                          color: Colors.grey[200],
                          border: Border.all(color: Colors.white),
                          borderRadius: BorderRadius.circular(12)),
                      child: TextFormField(
                        controller:mycontroller ,
                        validator:vlaid,
                          decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.grey[200],
                        hintText: hint,
                        border: InputBorder.none,
                      )),
                    );
  }
}
