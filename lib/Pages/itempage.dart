import 'package:appfood/Widgets/appbar_widget.dart';
import 'package:appfood/Widgets/drawerwidget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

import '../Widgets/itembottom.dart';
class ItemPage extends StatelessWidget {
  const ItemPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(top: 5),
        child: ListView(
          children: [
            const AppBarWidget(),
            Padding(
              padding: const EdgeInsets.all(16),
              child: Image.asset("images/burger.png",height: 300,width: double.infinity,),
            ),
            Padding(
              padding:const EdgeInsets.symmetric(horizontal: 15,vertical: 15),
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
                        itemBuilder: (context, _) => const Icon(Icons.star,color: Colors.red,),
                        onRatingUpdate: (value) {
                        },
                      ),
                      const Text("\$ 10",style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold),)
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text("Hot Burger",style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold),),
                        Container(
                          width: 80,
                          height: 30,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            boxShadow: [boxshadow()],
                            color: Colors.red,
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: const [
                              Icon(CupertinoIcons.minus,color: Colors.white,),
                              Text("1"),
                              Icon(CupertinoIcons.add,color: Colors.white,)
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                  const SizedBox(
                    width: double.infinity,
                    height: 80,
                    child: Text("The Hamberger was popular already in 1869 and is believed to be a precursor to the modern Hamburger."),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 15),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text("Delievery Time:",style: TextStyle(fontWeight: FontWeight.bold),),
                        Row(
                          children: const [
                            Icon(Icons.timer,color: Colors.red,),
                            Text("30 minutes")
                          ],
                        )
                      ],
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
      drawer: const DrawerWidget(),
      bottomNavigationBar: const Itembottom(),
    );
  }
}
