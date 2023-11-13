import 'package:appfood/bloc/add_to_cart_bloc.dart';
import 'package:appfood/bloc/add_to_cart_event.dart';
import 'package:appfood/bloc/add_to_cart_state.dart';
import 'package:appfood/widgets/appbar_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CartbottomBar extends StatefulWidget {
  const CartbottomBar({Key? key}) : super(key: key);

  @override
  State<CartbottomBar> createState() => _CartbottomBarState();
}

class _CartbottomBarState extends State<CartbottomBar> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CartBloc, CartState>(
      builder: (context, state) {
        return BottomAppBar(
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            height: 70,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    const Text(
                      "Tổng tiền:",
                      style:
                          TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(width: 15),
                    Text(state.totalPrice.toString())
                  ],
                ),
                Container(
                  decoration: BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: [boxShadow()],
                  ),
                  child: ElevatedButton(
                    onPressed: () {
                      if(state.cartItem.isEmpty){
                        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                          content: Text("Vui lòng đặt đồ ăn vào giỏ hàng!"),
                          duration: Duration(seconds: 2),
                        ));
                      }else{
                        context.read<CartBloc>().add(RemoveAllFromCart());
                        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                          content: Text("Bạn đã đặt đồ thành công!"),
                          duration: Duration(seconds: 2),
                        ));
                      }
                    },
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(Colors.red),
                      padding: MaterialStateProperty.all(
                          const EdgeInsets.symmetric(
                              horizontal: 15, vertical: 15)),
                      shape: MaterialStateProperty.all(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                    ),
                    child: const Text(
                      "Đặt đồ",
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
