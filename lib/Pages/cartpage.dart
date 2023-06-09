import 'package:appfood/Widgets/appbar_widget.dart';
import 'package:appfood/Widgets/drawerwidget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

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
      body: ListView(
        children: [
          SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const AppBarWidget(),
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10,vertical: 10),
                    child: Text("Order List",style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold),),
                  ),
                  cart("images/pizza.png", "Hot Pizza", "Taste Our Hot Pizza", 10),
                  cart("images/burger.png", "Hot Burger", "Taste Our Hot Burger", 10),
                  cart("images/salan.png", "Hot Salan", "Taste Our Hot Salan", 10),
                  cart("images/biryani.png", "Hot Biryani", "Taste Our Hot Biryani", 10),
                  cart("images/drink.png", "Hot Drink", "Taste Our Hot Drink", 5),
                  Padding(
                    padding:const EdgeInsets.symmetric(vertical: 30,horizontal: 20),
                    child:Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          boxShadow: [boxshadow()],
                          color: Colors.white
                      ),
                      child: Column(
                        children: [
                          Padding(
                            padding:const EdgeInsets.symmetric(vertical: 10,horizontal: 10),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: const [
                                Text("Item:",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
                                Text("10",style: TextStyle(fontSize: 20),),
                              ],
                            ),
                          ),
                          const Divider(
                            color: Colors.black,
                          ),
                          payment("Sub-Total:", "\$ 60"),
                          const Divider(
                            color: Colors.black,
                          ),
                          payment("Delievery:", "\$20"),
                          const Divider(
                            color: Colors.black,
                          ),
                          payment("Total:", "\$80")
                        ],
                      ),
                    ) ,
                  )
                ],
              ),
            ),
          )
        ],
      ),
      drawer: const DrawerWidget(),
      bottomNavigationBar: const CartbottomBar(),
    );
  }
}

Padding cart(String image,String name, String name1,int money){
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 10),
    child: Container(
      width: double.infinity,
      height: 100,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [boxshadow()]
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Container(
                alignment: Alignment.center,
                child: Image.asset(image,width: 150,height: 80,),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(name,style: const TextStyle(fontWeight: FontWeight.bold,fontSize: 20),),
                  Text(name1,style: const TextStyle(fontSize: 14),),
                  Text("\$$money",style: const TextStyle(color: Colors.red,fontWeight: FontWeight.bold,fontSize: 20),)
                ],
              ),
            ],
          ),
          Padding(
            padding:const EdgeInsets.symmetric(vertical: 5),
            child: Container(
              padding: const EdgeInsets.all(5),
              decoration: BoxDecoration(
                color: Colors.red,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  Icon(CupertinoIcons.minus,color: Colors.white,),
                  Text("2"),
                  Icon(CupertinoIcons.minus,color: Colors.white,)
                ],
              ),
            ),
          )
        ],
      ),
    ),
  );
}
Padding payment(String name, String money){
  return Padding(
    padding:const EdgeInsets.symmetric(vertical: 10,horizontal: 10),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(name,style: const TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
        Text(money,style: const TextStyle(fontSize: 20),),
      ],
    ),
  );
}

