import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../Widgets/appbar_widget.dart';
import '../Widgets/categories.dart';
import '../Widgets/drawerwidget.dart';
import '../Widgets/newest.dart';
import '../Widgets/popular.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          const AppBarWidget(),
          Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15,vertical: 15),
              child: Container(
                width: double.infinity,
                height: 50,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [boxshadow()]
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          const Icon(Icons.search,color: Colors.red,),
                          SizedBox(
                            width: 300,
                            height: 50,
                            child: Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 15),
                              child: TextFormField(
                                decoration: const InputDecoration(
                                  hintText: "Mon an ban thich ?",
                                  border: InputBorder.none,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      const Icon(Icons.filter_list)
                    ],
                  ),
                ),
              ),
          ),
          text("Categories"),
          const Categories(),
          text("Popular"),
          const Popular(),
          text("Newest"),
          const Newest(),
        ],
      ),
      drawer:const DrawerWidget() ,
      floatingActionButton: Container(
        decoration: BoxDecoration(
          boxShadow: [boxshadow()],
          borderRadius: BorderRadius.circular(20),
        ),
        child: FloatingActionButton(
          onPressed: () {
            Navigator.pushNamed(context, "cartPage");
          },
          backgroundColor: Colors.white,
          child: const Icon(CupertinoIcons.cart,color: Colors.red,),
        ),
      ),
    );
  }
}

Padding text(String textbaner){
  return Padding(
    padding: const EdgeInsets.only(left: 15,top: 20),
    child: Text(textbaner,style: const TextStyle(fontWeight: FontWeight.bold,fontSize: 20),),
  );
}