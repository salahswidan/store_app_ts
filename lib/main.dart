import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:store_app_2/screens/home_page.dart';
import 'package:store_app_2/screens/update_product_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        HomePage.id : (context) => HomePage(),
        UpdateProductPage.id : (context) => UpdateProductPage(), 
      },
      initialRoute: HomePage.id,
      debugShowCheckedModeBanner: false,
    
      // home: HomePage(),
    );
  }
}
