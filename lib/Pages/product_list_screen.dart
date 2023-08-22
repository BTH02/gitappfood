import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../Bloc/add_to_cart_bloc.dart';
import '../Bloc/add_to_cart_event.dart';
import '../Bloc/add_to_cart_state.dart';
import '../Widgets/appbar_widget.dart';
import '../modal/product.dart';
class ProductListScreen extends StatelessWidget {
  const ProductListScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final List<Product> productList = [
      Product(id: 1,pathImage: 'images/burger.png', name: 'Burger', price: 10),
      Product(id: 2, pathImage: 'images/pizza.png',name: 'Pizza', price: 10,),
      Product(id: 3, pathImage:'images/drink.png' ,name: 'Drink', price: 5,),
      Product(id: 4, pathImage: 'images/salan.png',name: 'Salan', price: 10,),
      Product(id: 5, pathImage: 'images/biryani.png',name: 'Biryani', price: 10,)
    ];
    return Scaffold(
      appBar: AppBar(
        title: Text("PRODUCT"),
        centerTitle: true,
        actions: [
          BlocBuilder<CartBloc,CartState>(
            builder: (context, state) {
              int count = state.cartItem.length;
              return Stack(
                children: [
                  IconButton(
                      onPressed: () {
                        Navigator.pushNamed(context, 'cartPage');
                      },
                      icon: Icon(Icons.shopping_bag_outlined)),
                  Positioned(child: Container(
                    padding: EdgeInsets.all(6),
                    decoration: BoxDecoration(
                      color: Colors.red,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    constraints: BoxConstraints(
                      minWidth: 10,
                      minHeight: 15,
                    ),
                    child: Text("$count",style: TextStyle(color: Colors.white,fontSize: 8),textAlign: TextAlign.center,),
                  ))
                ],
              );
            },
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: productList.length,
        itemBuilder:(context, index) {
          final product = productList[index];
        return ListTile(
          title: Row(
            children: [
              Image.asset(product.pathImage,height: 50,width: 50,),
              Text(product.name),
            ],
          ),
          subtitle: Text("\$${product.price}"),
          trailing: IconButton(
            icon: Icon(Icons.add_shopping_cart),
            onPressed: () {
              final cartBloc = context.read<CartBloc>();
              final cartItems = cartBloc.state.cartItem;
              if(cartItems.any((item) => item.id == product.id)){
                product.countitem++;
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Product already add to cart"),duration: Duration(seconds: 2),));
              }
              else{
                cartBloc.add(AddCart(product));
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Product add to cart"),duration: Duration(seconds: 2),));
              }
          },),
        );
      },),
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
    );
  }
}
