import 'package:appfood/Bloc/add_to_cart_bloc.dart';
import 'package:appfood/Bloc/add_to_cart_state.dart';
import 'package:appfood/Widgets/appbar_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../Bloc/add_to_cart_event.dart';
import '../Widgets/cartbottom.dart';


class CartPage extends StatefulWidget {
  const CartPage({Key? key}) : super(key: key);

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        title: Text("My Cart"),
        centerTitle: true,
      ),
      body: BlocBuilder<CartBloc, CartState>(
        builder: (context, state) {
          if (state.cartItem.isEmpty) {
            return Center(
              child: Text("Your cart is empty"),
            );
          } else {
            return ListView.builder(
              itemCount: state.cartItem.length,
              itemBuilder: (context, index) {
                return Column(
                  children: [
                    ListTile(
                      title: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Image.asset(state.cartItem[index].pathImage,height: 50,width: 50,),
                              Text(state.cartItem[index].name),
                            ],
                          ),
                          Text(
                            "${state.cartItem[index].countitem}",
                            style: TextStyle(color: Colors.red),
                          ),
                        ],
                      ),
                      subtitle: Text("\$${state.cartItem[index].price}"),
                      trailing: IconButton(
                        icon: Icon(Icons.remove_shopping_cart_outlined),
                        onPressed: () {
                          final cartBloc = BlocProvider.of<CartBloc>(context);
                          cartBloc.add(RemoveFromCart(state.cartItem[index]));
                        },
                      ),
                    ),
                  ],
                );
              },
            );
          }
        },
      ),
      floatingActionButton: Container(
        decoration: BoxDecoration(
          boxShadow: [boxshadow()],
          borderRadius: BorderRadius.circular(20),
        ),
        child: FloatingActionButton(
          onPressed: () {
            Navigator.pushNamed(context, "/");
          },
          backgroundColor: Colors.white,
          child: const Icon(CupertinoIcons.home,color: Colors.red,),
        ),
      ),
      bottomNavigationBar: CartbottomBar(),
    );
  }
}
