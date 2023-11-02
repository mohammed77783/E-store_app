
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../constant.dart';
import '../../main.dart';
import '../widget/customTextfor_loin_regester.dart';
import 'package:provider/provider.dart';
import 'package:estore/component/curd.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
 TextEditingController emailcontroller = TextEditingController();
      TextEditingController passwordcontrller=TextEditingController();
      GlobalKey<FormState> fotmsta=new GlobalKey();
      crud cur =new crud();
      bool loginsta=false;
    loginfunction() async {
  loginsta=true;
  setState(() {
  });
    if (fotmsta.currentState!.validate()) {
      var re= await cur.postrequest(link_of_login, {
        "email": emailcontroller.text,
        "psssword": passwordcontrller.text
      });
        loginsta=false;
  setState(() {
  });
    if(re['state']=='succese'){
     shp.setInt('Id', re['data']['user_id']);
     shp.setString('username', re['data']['username'].toString());
     shp.setString('email', re['data']['email'].toString());
     shp.setInt('type', re['data']['type']);
     if( re['data']['type']==1){
 Navigator.pushReplacementNamed(context, "Homepage");
     }
     else if(re['data']['type']==0){
 Navigator.pushReplacementNamed(context, "Dashbord");
     }
     
                 
                 }
                 else {
showDialog(context: context, builder: (bilder)
{
 return SimpleDialog(title: Text("Error"),children: [Center(child: Text("The Email or password in no corect"))],);
});
                 }

                 }
    }
  @override
  Widget build(BuildContext context) {
  

    return Scaffold(
      backgroundColor: Colors.white,
      body:SafeArea(
          child: Center(
            child: SingleChildScrollView(
              child:loginsta?Center(child: CircularProgressIndicator(),):Form(
                key:fotmsta ,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.shopping_bag,size: 100,color: Color(0xFF4C53A5),),
                  SizedBox(
                    height: 75,
                  ),
                  Text(
                    "Hello  in our Shop!",
                    style:GoogleFonts.bebasNeue(fontSize: 54,color: Color(0xFF4C53A5))
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  const Text(
                    "Welcome back, you\'ve been missed",
                    style: TextStyle(fontSize: 20),
                  ),
                 
                  SizedBox(
                    height: 50,
                  ),
                          
              custextFo_reg_log(hint: 'Email',mycontroller:emailcontroller,vlaid: (value) {
                            if (value!.length > 100) {
                              return "Email can't to be larger then 100";
                            }
                            if (value!.length < 2) {
                              return "Email can't to be less Two";
                            }
                            return null;
                          },),                  
                   SizedBox(
                        height: 10,
                      ),
                custextFo_reg_log(hint: 'Password',mycontroller:passwordcontrller
                ,vlaid: (value) {
                            if (value!.length > 100) {
                              return "Passwored can't to be larger then 100";
                            }
                            if (value!.length < 2) {
                              return "password can't to be less Two";
                            }
                            return null;
                          },),  
                        SizedBox(
                        height: 30,
                      ), SizedBox(
                    height: 40,
                  ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: InkWell(
                    onTap: ()async{
   await loginfunction();
                  
                    },
                    child: Container(decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      color:Color(0xFF4C53A5),
                    ),
                    
                    padding: EdgeInsets.all(25),
                      child: Center(
                        child: Text("Login",style: TextStyle(color: 
                        Colors.white,fontWeight: FontWeight.bold,fontSize: 18,),),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                    height: 25,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center
                    ,children: [
                      Text("Not a Member? ",style: TextStyle(fontWeight: FontWeight.bold),),
                       InkWell(
                        onTap: (){
                            Navigator.pushNamed(context, "siginscreen");
                            
                        },
                         child: Text("Register now",style: TextStyle(fontWeight: FontWeight.bold,color:
                         Color(0xFF4C53A5)),),
                       )
                    ],)
                ]),
              ),
            ),
          ))
 

);
     }
}