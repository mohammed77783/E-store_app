import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../constant.dart';
import '../widget/customTextfor_loin_regester.dart';
import 'package:provider/provider.dart';

import 'package:estore/component/curd.dart';
class registerScreen extends StatefulWidget {
   registerScreen({super.key});
  
  @override
  State<registerScreen> createState() => _registerScreenState();
}

class _registerScreenState extends State<registerScreen> {
  final usernamecontr = TextEditingController();
  final emailcontroller = TextEditingController();
  final passwordcontrller = TextEditingController();
  GlobalKey<FormState> formstate = new GlobalKey();
  crud cur=new crud();
  bool isload=false;
    siginup() async {
    var formtemp = formstate.currentState;
    if (formtemp!.validate()) {
      
      setState(() {  
         isload=true;
      });
      var re= await cur.postrequest(link_of_siginup, {
        "username": usernamecontr.text,
        "email": emailcontroller.text,
        "psssword": passwordcontrller.text
      });
     
  setState(() {  
     isload=false;
      });
    if(re['state']=='succese'){
                  Navigator.pushReplacementNamed(context, "registersuces");
                 }
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
          child: Center(
            child: SingleChildScrollView(
              child: Form(
                key: formstate,
                child:(isload)?Center(child: CircularProgressIndicator(),) : Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.shopping_bag,
                      size: 100,
                      color: Color(0xFF4C53A5),
                    ),
                    SizedBox(
                      height: 75,
                    ),
                    Text("Hello  in our App!",
                        style: GoogleFonts.bebasNeue(
                            fontSize: 54, color: Color(0xFF4C53A5))),
                    SizedBox(
                      height: 10,
                    ),
                    const Text(
                      "You are in the right place",
                      style: TextStyle(fontSize: 20),
                    ),
                    SizedBox(
                      height: 50,
                    ),
                
                   custextFo_reg_log(hint:"User name" ,mycontroller:usernamecontr,vlaid:(val) {
                      if (val!.length > 100) {
                        return "Username can't to be larger then 100";
                      }
                      if (val.length < 2) {
                        return "Username can't to be less Two";
                      }
                      return null;
                    }),
                    SizedBox(
                      height: 10,
                    ),
              custextFo_reg_log(hint: 'Email',mycontroller:emailcontroller,vlaid: (value) {
                      if (value!.length > 100) {
                        return "Email can't to be larger then 100";
                      }
                      if (value.length < 2) {
                        return "Email can't to be less Two";
                      }
                      return null;
                    },),                  
                 SizedBox(
                      height: 10,
                    ),
                            custextFo_reg_log(hint: 'Password',mycontroller:passwordcontrller,vlaid: (value) {
                      if (value!.length > 100) {
                        return "Passwored can't to be larger then 100";
                      }
                      if (value.length < 2) {
                        return "password can't to be less Two";
                      }
                      return null;
                    }),  
                      SizedBox(
                      height: 30,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 25.0),
                      child: InkWell(
                        onTap: (){
                            siginup();
                     
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                            color: Color(0xFF4C53A5),
                          ),
                          padding: EdgeInsets.all(25),
                          child: Center(
                            child: Text(
                              "Sign In",
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 18,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 25,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Not a Member? ",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        Text(
                          "Register now",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Color(0xFF4C53A5)),
                        )
                      ],
                    )
                  ]),
              ),
            ),
          ),
        ));
  }
}
