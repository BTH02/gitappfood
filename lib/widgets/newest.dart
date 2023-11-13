import 'package:appfood/widgets/appbar_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class Newest extends StatelessWidget {
  const Newest({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      child: Column(
        children: [
          newest("images/pizza.png", "Hot Pizza",
              "Taste Our Hot Pizza, We Provide Our Great Foods", 10),
          newest("images/burger.png", "Hot Burger",
              "Taste Our Hot Burger, We Provide Our Great Foods", 10),
          newest("images/biryani.png", "Hot Burger",
              "Taste Our Hot Biryani, We Provide Our Great Foods", 10),
          newest("images/salan.png", "Hot Burger",
              "Taste Our Hot Salan, We Provide Our Great Foods", 10),
          newest("images/drink.png", "Hot Drink",
              "Taste Our Hot Drink, We Provide Our Great Foods", 5),
        ],
      ),
    );
  }
}

Padding newest(String image, String name, String name1, int money) {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 10),
    child: Container(
      width: double.infinity,
      height: 150,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [boxShadow()]),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              InkWell(
                onTap: () {},
                child: Container(
                  alignment: Alignment.center,
                  child: Image.asset(
                    image,
                    height: 120,
                    width: 130,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: SizedBox(
                  width: 130,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text(
                        name,
                        style: const TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        name1,
                        style: const TextStyle(fontSize: 16),
                      ),
                      RatingBar.builder(
                        initialRating: 4,
                        minRating: 1,
                        direction: Axis.horizontal,
                        itemCount: 5,
                        itemSize: 18,
                        itemPadding: const EdgeInsets.symmetric(horizontal: 4),
                        itemBuilder: (context, _) => const Icon(
                          Icons.star,
                          color: Colors.red,
                        ),
                        onRatingUpdate: (value) {},
                      ),
                      Text(
                        "\$ $money",
                        style: const TextStyle(
                            color: Colors.red,
                            fontSize: 20,
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
              ),
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Icon(
                      Icons.favorite_border,
                      color: Colors.red,
                    ),
                    Icon(
                      CupertinoIcons.cart,
                      color: Colors.red,
                    )
                  ],
                ),
              )
            ],
          ),
        ],
      ),
    ),
  );
}
