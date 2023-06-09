import 'package:appfood/Pages/itempage.dart';
import 'package:flutter/material.dart';

import 'Pages/cartpage.dart';
import 'Pages/homepage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Food App",
      debugShowCheckedModeBanner: false,
      theme: ThemeData(scaffoldBackgroundColor: const Color(0xFFF5F5F3)),
      routes: {
        "/" :(context) => const HomePage(),
        "cartPage" : (context) => const CartPage(),
        "itemPage" : (context) =>const ItemPage(),
      },
    );
  }
}

