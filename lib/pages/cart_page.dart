import 'package:appfood/bloc/add_to_cart_bloc.dart';
import 'package:appfood/bloc/add_to_cart_state.dart';
import 'package:appfood/constants/text_style.dart';
import 'package:appfood/widgets/appbar_widget.dart';
import 'package:appfood/bloc/add_to_cart_event.dart';
import 'package:appfood/routes/routes.dart';
import 'package:appfood/widgets/cartbottom.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
        title: const Text("Giỏ Hàng"),
        centerTitle: true,
      ),
      body: BlocBuilder<CartBloc, CartState>(
        builder: (context, state) {
          if (state.cartItem.isEmpty) {
            return const Center(
              child: Text("Giỏ hàng của bạn đang không có sản phẩm"),
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
                              Image.asset(
                                state.cartItem[index].pathImage,
                                height: 50,
                                width: 50,
                              ),
                              Text(state.cartItem[index].name,style: TextStyles.text16BoldBlack(),),
                            ],
                          ),
                          Row(
                            children: [
                              IconButton(
                                  onPressed: () {
                                    if (state.cartItem[index].countItem < 2) {
                                      showDialog(
                                        context: context,
                                        builder: (context) {
                                          return AlertDialog(
                                            title: const Text(
                                                "Bạn có muốn hủy bỏ món ăn?"),
                                            actions: [
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceAround,
                                                children: [
                                                  ElevatedButton(
                                                      onPressed: () {
                                                        context
                                                            .read<CartBloc>()
                                                            .add(RemoveFromCart(
                                                                state.cartItem[
                                                                    index]));
                                                        Navigator.pop(context);
                                                      },
                                                      child:
                                                          const Text("Đồng Ý")),
                                                  ElevatedButton(
                                                      onPressed: () {
                                                        Navigator.pop(context);
                                                      },
                                                      child:
                                                          const Text("Hủy Bỏ")),
                                                ],
                                              )
                                            ],
                                          );
                                        },
                                      );
                                    } else {
                                      context
                                          .read<CartBloc>()
                                          .add(Decrease(state.cartItem[index]));
                                    }
                                  },
                                  icon: const Icon(Icons.remove)),
                              Text(
                                "${state.cartItem[index].countItem}",
                                style: const TextStyle(color: Colors.red),
                              ),
                              IconButton(
                                  onPressed: () {
                                    context
                                        .read<CartBloc>()
                                        .add(Increase(state.cartItem[index]));
                                  },
                                  icon: const Icon(Icons.add)),
                            ],
                          )
                        ],
                      ),
                      subtitle: Text("\$${state.cartItem[index].price}",style: TextStyles.text16BoldRed(),),
                      trailing: IconButton(
                        icon: const Icon(Icons.remove_shopping_cart_outlined),
                        onPressed: () {
                          showDialog(
                            context: context,
                            builder: (context) {
                              return AlertDialog(
                                title: const Text(
                                    "Bạn có muốn hủy bỏ món ăn?"),
                                actions: [
                                  Row(
                                    mainAxisAlignment:
                                    MainAxisAlignment
                                        .spaceAround,
                                    children: [
                                      ElevatedButton(
                                          onPressed: () {
                                            context
                                                .read<CartBloc>()
                                                .add(RemoveFromCart(
                                                state.cartItem[
                                                index]));
                                            Navigator.pop(context);
                                          },
                                          child:
                                          const Text("Đồng Ý")),
                                      ElevatedButton(
                                          onPressed: () {
                                            Navigator.pop(context);
                                          },
                                          child:
                                          const Text("Hủy Bỏ")),
                                    ],
                                  )
                                ],
                              );
                            },
                          );
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
          boxShadow: [boxShadow()],
          borderRadius: BorderRadius.circular(20),
        ),
        child: FloatingActionButton(
          onPressed: () {
            Navigator.pushNamed(context, Routes.home);
          },
          backgroundColor: Colors.white,
          child: const Icon(
            CupertinoIcons.home,
            color: Colors.red,
          ),
        ),
      ),
      bottomNavigationBar: const CartbottomBar(),
    );
  }
}
