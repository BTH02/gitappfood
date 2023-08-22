import 'package:appfood/Bloc/add_to_cart_bloc.dart';
import 'package:appfood/Bloc/add_to_cart_state.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../Widgets/appbar_widget.dart';
import '../Widgets/categories.dart';
import '../Widgets/drawerwidget.dart';
import '../Widgets/newest.dart';
import '../Widgets/popular.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          const AppBarWidget(),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
            child: Container(
              width: 300,
              height: 50,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [boxshadow()]),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Row(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Icon(
                          Icons.search,
                          color: Colors.red,
                        ),
                        Container(
                          width: 250,
                          height: 50,
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 15),
                            child: TextFormField(
                              decoration: const InputDecoration(
                                hintText: "Mon an ban thich la gi?",
                                border: InputBorder.none,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    const Icon(Icons.filter_list)
                  ],
                ),
              ),
            ),
          ),
          text("Categories"),
          const Categories(),
          text("Popular"),
          const Popular(),
          text("Newest"),
          const Newest(),
        ],
      ),
      drawer: const DrawerWidget(),
      floatingActionButton: BlocBuilder<CartBloc, CartState>(
        builder: (context, state) {
          int count = state.cartItem.length;
          return Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Container(
                decoration: BoxDecoration(
                  boxShadow: [boxshadow()],
                  borderRadius: BorderRadius.circular(20),
                ),
                child: FloatingActionButton(
                  onPressed: () {
                    Navigator.pushNamed(context, "productList");
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
                  boxShadow: [boxshadow()],
                  borderRadius: BorderRadius.circular(20),
                ),
                child: FloatingActionButton(
                    onPressed: () {
                      Navigator.pushNamed(context, "cartPage");
                    },
                    backgroundColor: Colors.white,
                    child: Stack(
                      children: [
                        IconButton(
                            onPressed: () {
                              Navigator.pushNamed(context, 'cartPage');
                            },
                            icon: Icon(
                              Icons.shopping_cart,
                              color: Colors.red,
                            )),
                        Positioned(
                            child: Container(
                          padding: EdgeInsets.all(3),
                          decoration: BoxDecoration(
                            color: Colors.red,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          constraints: BoxConstraints(
                            minWidth: 10,
                            minHeight: 15,
                          ),
                          child: Text(
                            "$count",
                            style: TextStyle(color: Colors.white, fontSize: 8),
                            textAlign: TextAlign.center,
                          ),
                        ))
                      ],
                    )),
              ),
            ],
          );
        },
      ),
    );
  }
}

Padding text(String textbaner) {
  return Padding(
    padding: const EdgeInsets.only(left: 15, top: 20),
    child: Text(
      textbaner,
      style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
    ),
  );
}
