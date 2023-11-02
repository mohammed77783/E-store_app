import 'package:flutter/material.dart';

class registersuccess extends StatefulWidget {
  const registersuccess({super.key});

  @override
  State<registersuccess> createState() => _registersuccessState();
}

class _registersuccessState extends State<registersuccess> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
mainAxisAlignment: MainAxisAlignment.center,        children: [
           const Text(
                    "your acount create successfully ",
                    style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 40,),
                   Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 25.0),
                      child: InkWell(
                        onTap: (){
                       Navigator.pushReplacementNamed(context, "/login");
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                            color: Color(0xFF4C53A5),
                          ),
                          padding: EdgeInsets.all(25),
                          child: Center(
                            child: Text(
                              "go to login",
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
                  
      ],),
    );
  }
}