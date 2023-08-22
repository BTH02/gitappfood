import 'package:appfood/Bloc/add_to_cart_bloc.dart';
import 'package:appfood/Pages/itempage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'Pages/cartpage.dart';
import 'Pages/homepage.dart';
import 'Pages/product_list_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CartBloc(),
      child: MaterialApp(
        title: "Food App",
        debugShowCheckedModeBanner: false,
        theme: ThemeData(scaffoldBackgroundColor: const Color(0xFFF5F5F3)),
        routes: {
          "/" :(context) => const HomePage(),
          "cartPage" : (context) => const CartPage(),
          "itemPage" : (context) =>const ItemPage(),
          "productList":(context) => const ProductListScreen(),
        },
      ),
    );
  }
}

