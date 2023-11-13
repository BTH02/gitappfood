import 'package:appfood/modal/product.dart';
import 'package:appfood/pages/cart_page.dart';
import 'package:appfood/pages/home_page.dart';
import 'package:appfood/pages/item_page.dart';
import 'package:appfood/pages/login/login_page.dart';
import 'package:appfood/pages/product_list_screen.dart';
import 'package:flutter/material.dart';

class Routes {
  const Routes._();

  static const String home = '/home';
  static const String cartPage = '/cartPage';
  static const String itemPage = '/itemPage';
  static const String productList = '/productList';
  static const String login = '/login';

  static Map<String, Widget Function(dynamic context)> routes = {
    home: (context) {
      final arg = (ModalRoute.of(context)?.settings.arguments ?? Product.pure())
          as Product;

      return HomePage(product: arg);
    },
    cartPage: (context) => const CartPage(),
    itemPage: (context) {
      final arg = (ModalRoute.of(context)?.settings.arguments ?? Product.pure())
          as Product;

      return ItemPage(product: arg);
    },
    productList: (context) => const ProductListScreen(),
    login:(context) => const LoginPage(),
  };
}
