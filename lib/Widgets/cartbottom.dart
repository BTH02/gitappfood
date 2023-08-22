import 'package:appfood/Bloc/add_to_cart_bloc.dart';
import 'package:appfood/Bloc/add_to_cart_state.dart';
import 'package:appfood/Widgets/appbar_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CartbottomBar extends StatelessWidget {
  const CartbottomBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      child: BlocBuilder<CartBloc,CartState>(
        builder: (context, state) {
          return Container(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            height: 70,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Text("Total:",style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold),),
                    SizedBox(width:15),
                  ],
                ),
                Container(
                    decoration: BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.circular(20),
                      boxShadow: [boxshadow()],
                    ),
                    child: ElevatedButton(
                      onPressed: () {

                      },
                      style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all(Colors.red),
                          padding: MaterialStateProperty.all(const EdgeInsets.symmetric(horizontal: 15,vertical: 15)),
                          shape: MaterialStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)))
                      ),
                      child: const Text("Order Now",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
                    )
                )
              ],
            ),
          );
        },
      )
    );
  }
}
