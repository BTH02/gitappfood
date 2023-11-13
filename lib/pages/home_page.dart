import 'package:appfood/bloc/add_to_cart_bloc.dart';
import 'package:appfood/bloc/add_to_cart_state.dart';
import 'package:appfood/constants/space.dart';
import 'package:appfood/constants/text_style.dart';
import 'package:appfood/routes/routes.dart';
import 'package:appfood/widgets/appbar_widget.dart';
import 'package:appfood/widgets/categories.dart';
import 'package:appfood/widgets/drawerwidget.dart';
import 'package:appfood/widgets/newest.dart';
import 'package:appfood/widgets/popular.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../modal/product.dart';
import 'show_search.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key, required this.product}) : super(key: key);

  final Product product;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const AppBarWidget(),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
              child: Container(
                width: double.infinity,
                height: 50,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: [boxShadow()]),
                child: TextFormField(
                  onTap: () {
                    showSearch(context: context, delegate: ShowSearch());
                  },
                  decoration: const InputDecoration(
                    hintText: "Món ăn bạn thích là gì?",
                    prefixIcon: Icon(Icons.search),
                    prefixIconColor: Colors.red,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 150,
              child: PageView(
                children: [
                  Image.asset(
                    "images/foodbanner.png",
                  ),
                  Image.asset(
                    "images/foodbanner1.png",
                    width: double.infinity,
                  ),
                  Image.asset(
                    "images/Foodbanner2.png",
                    width: double.infinity,
                  ),
                ],
              ),
            ),
            text("Thể loại"),
            const Categories(),
            text("Hot"),
            kVertical12,
            const ListPopular(),
            text("Món ăn mới"),
            const Newest(),
          ],
        ),
      ),
      drawer: const DrawerWidget(),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Container(
            decoration: BoxDecoration(
              boxShadow: [boxShadow()],
              borderRadius: BorderRadius.circular(20),
            ),
            child: FloatingActionButton(
              onPressed: () {
                Navigator.pushNamed(context, Routes.productList);
              },
              backgroundColor: Colors.white,
              child: const Icon(
                Icons.restaurant_menu,
                color: Colors.red,
              ),
            ),
          ),
          Container(
            decoration: BoxDecoration(
              boxShadow: [boxShadow()],
              borderRadius: BorderRadius.circular(20),
            ),
            child: FloatingActionButton(
                heroTag: UniqueKey(),
                onPressed: () {
                  Navigator.pushNamed(context, Routes.cartPage);
                },
                backgroundColor: Colors.white,
                child: Stack(
                  children: [
                    IconButton(
                      onPressed: () {
                        Navigator.pushNamed(context, Routes.cartPage);
                      },
                      icon: const Icon(Icons.shopping_cart, color: Colors.red),
                    ),
                    BlocBuilder<CartBloc, CartState>(
                      builder: (context, state) {
                        final count = state.cartItem.length;

                        return Positioned(
                            child: Container(
                          padding: const EdgeInsets.all(3),
                          decoration: BoxDecoration(
                            color: Colors.red,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          constraints: const BoxConstraints(
                            minWidth: 10,
                            minHeight: 15,
                          ),
                          child: Text(
                            "$count",
                            style: const TextStyle(
                                color: Colors.white, fontSize: 8),
                            textAlign: TextAlign.center,
                          ),
                        ));
                      },
                    )
                  ],
                )),
          ),
        ],
      ),
    );
  }
}

Padding text(String textbaner) {
  return Padding(
    padding: const EdgeInsets.only(left: 15, top: 20),
    child: Text(
      textbaner,
      style: TextStyles.text20Bold(),
    ),
  );
}
