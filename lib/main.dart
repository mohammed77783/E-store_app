import 'package:estore/provider_mode/provider_cart.dart';
import 'package:estore/provider_mode/provider_product.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'View/admin/Category/add_catagroy.dart';
import 'View/admin/Category/edite_category.dart';
import 'View/admin/Category/show_Catagroy.dart';
import 'View/admin/main_dashbord.dart';
import 'View/admin/product/add_product.dart';
import 'View/admin/product/edit_prodcut.dart';
import 'View/admin/product/show_product.dart';
import 'View/user/Cartpage.dart';
import 'View/user/Homepage.dart';
import 'View/auth/regeistersucess.dart';
import 'View/user/itempage.dart';
import 'View/auth/login.dart';
import 'View/auth/register.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'provider_mode/provider_Catagory.dart';

late SharedPreferences shp;
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  shp = await SharedPreferences.getInstance();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (create) {
            return catagroy();
          }),
          ChangeNotifierProvider(create: (create) {
            return product();
          }),
          ChangeNotifierProvider(create: (create) {
            return Cart();
          }),
        ],
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Flutter Demo',
          theme: ThemeData(
              primaryColor: Color(0xFF4C53A5),
              scaffoldBackgroundColor: Colors.white),
          initialRoute:
           shp.getInt('Id') == null
              ? "login"
              : shp.getInt('type') == 1
                  ? "Homepage"
                  : shp.getInt('type') == 0
                      ?
                       'Dashbord'
                      : "registersuces"
                      ,
          routes: {
            "login": (context) => LoginScreen(),
            "Homepage": (context) => Homepage(),
            "CartPage": (context) => CartPage(),
           
            "siginscreen": (context) => registerScreen(),
            "registersuces": (context) => registersuccess(),
            "Dashbord": (context) => Dashbord(),
            'Add_category': (context) => add_catagroy(),
            'showCatagory': (context) => show_Catagory(),
            'show_product': (context) => show_product(),
            'add_product': (context) => add_product(),
            'edite_category': (context) => edite_category(),
            'edite_product': (context) => edite_product(),
          },
        ));
  }
}



