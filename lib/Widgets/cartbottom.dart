import 'package:appfood/Widgets/appbar_widget.dart';
import 'package:flutter/material.dart';

class CartbottomBar extends StatelessWidget {
  const CartbottomBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        height: 70,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: const [
                Text("Total",style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold),),
                SizedBox(width:15),
                Text("\$80",style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold,color: Colors.red))
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
      ),
    );
  }
}
