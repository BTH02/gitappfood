import 'package:appfood/bloc/add_to_cart_bloc.dart';
import 'package:appfood/bloc/add_to_cart_event.dart';
import 'package:appfood/constants/text_style.dart';
import 'package:appfood/modal/product.dart';
import 'package:appfood/routes/routes.dart';
import 'package:appfood/widgets/appbar_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

import '../bloc/add_to_cart_state.dart';

class ItemPage extends StatelessWidget {
  const ItemPage({Key? key, required this.product}) : super(key: key);

  final Product product;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          product.name,
        ),
        centerTitle: true,
        actions: [
          BlocBuilder<CartBloc, CartState>(
            builder: (context, state) {
              int count = state.cartItem.length;
              return Stack(
                children: [
                  IconButton(
                    onPressed: () {
                      Navigator.pushNamed(context, Routes.cartPage);
                    },
                    icon: const Icon(Icons.shopping_bag_outlined),
                  ),
                  Positioned(
                    child: Container(
                      padding: const EdgeInsets.all(6),
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
                        style:
                            const TextStyle(color: Colors.white, fontSize: 8),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                ],
              );
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 5),
        child: ListView(
          children: [
            // const AppBarWidget(),
            Padding(
              padding: const EdgeInsets.all(16),
              child: Image.asset(
                product.pathImage,
                height: 300,
                width: double.infinity,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      RatingBar.builder(
                        initialRating: 4,
                        minRating: 1,
                        direction: Axis.horizontal,
                        itemCount: 5,
                        itemSize: 18,
                        itemPadding: const EdgeInsets.symmetric(horizontal: 4),
                        itemBuilder: (context, _) => const Icon(
                          Icons.star,
                          color: Colors.red,
                        ),
                        onRatingUpdate: (value) {},
                      ),
                      Text(
                        "\$ ${product.price}",
                        style: TextStyles.text16BoldRed(),
                      )
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          product.name,
                          style: TextStyles.text25BoldBlack(),
                        ),
                        Container(
                          width: 105,
                          height: 40,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            boxShadow: [boxShadow()],
                            color: Colors.red,
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              IconButton(
                                  onPressed: () {},
                                  icon: const Icon(
                                    Icons.remove,
                                    color: Colors.white,
                                  )),
                              // Text(""),
                              IconButton(
                                  onPressed: () {
                                    // context.read<CartBloc>().add(Increase(state.cartItem[0]));
                                  },
                                  icon: const Icon(
                                    CupertinoIcons.add,
                                    color: Colors.white,
                                  ))
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    width: double.infinity,
                    height: 80,
                    child: Text(product.describe),
                  ),
                  const Padding(
                    padding: EdgeInsets.symmetric(vertical: 15),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Thời gian chờ:",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        Row(
                          children: [
                            Icon(
                              Icons.timer,
                              color: Colors.red,
                            ),
                            Text("30 phút")
                          ],
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 50,
                    width: 300,
                    child: ElevatedButton(
                        onPressed: () {
                          final cartBloc = context.read<CartBloc>();
                          final cartItems = cartBloc.state.cartItem;
                          if (cartItems.any((item) => item.id == product.id)) {
                            ScaffoldMessenger.of(context)
                                .showSnackBar(const SnackBar(
                              content: Text("Món ăn đã có trong giỏ hàng"),
                              duration: Duration(seconds: 2),
                            ));
                          } else {
                            cartBloc.add(AddCart(product));
                            ScaffoldMessenger.of(context)
                                .showSnackBar(const SnackBar(
                              content: Text("Đã thêm món ăn vào giỏ hàng"),
                              duration: Duration(seconds: 2),
                            ));
                          }
                        },
                        child: const Row(
                          children: [
                            SizedBox(
                              width: 60,
                            ),
                            Text("Them vao gio hang"),
                            Icon(Icons.add_shopping_cart)
                          ],
                        )),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
