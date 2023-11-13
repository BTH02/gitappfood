import 'package:appfood/bloc/add_to_cart_bloc.dart';
import 'package:appfood/bloc/add_to_cart_event.dart';
import 'package:appfood/bloc/add_to_cart_state.dart';
import 'package:appfood/constants/text_style.dart';
import 'package:appfood/modal/product.dart';
import 'package:appfood/routes/routes.dart';
import 'package:appfood/widgets/appbar_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

final List<Product> productList = [
  Product(
      id: 1,
      pathImage: 'images/burger.png',
      name: 'Burger',
      price: 10,
      describe:
          "Burger King Corporation, known as Hungry Jack's in Australia, is an American-based multinational chain of hamburger fast food restaurants. Headquartered in Miami-Dade County, Florida, the company was …"),
  Product(
      id: 2,
      pathImage: 'images/pizza.png',
      name: 'Pizza',
      price: 10,
      describe:
          "Pizza Hut is an American multinational restaurant chain and international franchise founded in 1958 in Wichita, Kansas by Dan and Frank Carney. The chain, headquartered in Plano, Texas, operates 17,63…"),
  Product(
      id: 3,
      pathImage: 'images/drink.png',
      name: 'Drink',
      price: 5,
      describe:
          "Energy Drink Sting Energy is a carbonated energy drink from PepsiCo International and produced by Rockstar Inc. Sting is available in flavors such as the original Gold Rush, Gold, Power Pacq, Power Lime and Berry …"),
  Product(
      id: 4,
      pathImage: 'images/salan.png',
      name: 'Salan',
      price: 10,
      describe:
          "A dish consisting of mixed pieces of food, with some definitions requiring at least one raw ingredient."),
  Product(
      id: 5,
      pathImage: 'images/biryani.png',
      name: 'Biryani',
      price: 10,
      describe:
          "Biryani is a mixed rice dish originating among the Muslims of South Asia. It is made with spices, vegetables, rice, and usually some type of meat. In some cases without any meat, and sometimes with e…")
];

class ProductListScreen extends StatelessWidget {
  const ProductListScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Món ăn"),
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
      body: ListView.builder(
        itemCount: productList.length,
        itemBuilder: (context, index) {
          final product = productList[index];
          return ListTile(
            title: Row(
              children: [
                Image.asset(
                  product.pathImage,
                  height: 50,
                  width: 50,
                ),
                Text(
                  product.name,
                  style: TextStyles.text16BoldBlack(),
                ),
              ],
            ),
            subtitle: Text(
              "\$${product.price}",
              style: TextStyles.text16BoldRed(),
            ),
            trailing: IconButton(
              icon: const Icon(Icons.add_shopping_cart),
              onPressed: () {
                final cartBloc = context.read<CartBloc>();
                final cartItems = cartBloc.state.cartItem;
                if (cartItems.any((item) => item.id == product.id)) {
                  ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                    content: Text("Món ăn đã có trong giỏ hàng"),
                    duration: Duration(seconds: 2),
                  ));
                } else {
                  cartBloc.add(AddCart(product));
                  ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                    content: Text("Đã thêm món ăn vào giỏ hàng"),
                    duration: Duration(seconds: 2),
                  ));
                }
              },
            ),
          );
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
    );
  }
}
