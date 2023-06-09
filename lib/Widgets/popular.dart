import 'package:appfood/Widgets/appbar_widget.dart';
import 'package:flutter/material.dart';

class Popular extends StatelessWidget {
  const Popular({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 5,vertical: 15),
        child: Row(
          children: [
            InkWell(
              onTap: () {
                Navigator.pushNamed(context, "itemPage");
              },
              child: popular("images/burger.png", "Hot Burger", "Taste Hot Burger", 10),
            ),
            popular("images/drink.png", "Hot Drink", "Drink Red Stinh", 5),
            popular("images/salan.png", "Hot Salan", "Salan", 10),
            popular("images/biryani.png", "Hot Biryani", "Biryani", 10),
            popular("images/pizza.png", "Hot Pizza", "Pizza", 10),
            popular("images/drink.png", "Hot Drink", "Drink Red Stinh", 5)
          ],
        ),
      ),
    );
  }
}

Padding popular(String img,String name, String name1,int money){
  return
    Padding(
      padding: const EdgeInsets.symmetric(horizontal: 7),
      child: Container(
        width: 170,
        height: 225,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [boxshadow()],
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            children: [
              Image.asset(img,height: 130,),
              Text(name,style: const TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
              const SizedBox(height: 4,),
              Text(name1),
              const SizedBox(height: 12,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('\$$money',style: const TextStyle(color: Colors.red,fontSize: 17,fontWeight: FontWeight.bold),),
                  const Icon(Icons.favorite_border,color: Colors.red,)
                ],
              )
            ],
          ),
        ),
      ),
    );
}
