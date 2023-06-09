import 'package:flutter/material.dart';

class Categories extends StatelessWidget {
  const Categories({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 15,horizontal: 5),
        child: Row(
          children: [
            image("images/drink.png"),
            image("images/pizza.png"),
            image("images/salan.png"),
            image("images/biryani.png"),
            image("images/burger.png"),
            image("images/burger.png"),
            image("images/burger.png"),
          ],
        ),
      ),
    );
  }
}

Padding image(String name){
  return Padding(
    padding: EdgeInsets.symmetric(horizontal: 10),
    child: Container(
      padding: EdgeInsets.all(8),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                spreadRadius: 2,
                blurRadius: 10,
                offset: Offset(0,3)
            )
          ]
      ),
      child: Image.asset("$name",width: 50,height: 50,),
    ),
  );
}