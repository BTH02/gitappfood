class Popular {
  final int id;
  final String img;
  final String name;
  final String name1;
  final int money;
  final String describe;
  Popular({
    required this.id,
    required this.img,
    required this.name,
    required this.name1,
    required this.money,
    required this.describe,
  });
}

final listPopular = [
  Popular(
    id: 6,
    name: "Hot Burger",
    img: 'images/burger.png',
    money: 10,
    name1: "Taste Hot Burger",
    describe: "Burger King Corporation, known as Hungry Jack's in Australia, is an American-based multinational chain of hamburger fast food restaurants. Headquartered in Miami-Dade County, Florida, the company was …",
  ),
  Popular(
      id: 7,
      name: "Hot Pizza",
      img: 'images/pizza.png',
      money: 10,
      name1: "Pizza",
      describe: "Pizza Hut is an American multinational restaurant chain and international franchise founded in 1958 in Wichita, Kansas by Dan and Frank Carney. The chain, headquartered in Plano, Texas, operates 17,63…"
  ),
  Popular(
    id: 8,
    name: "Hot Drink",
    img: 'images/drink.png',
    money: 5,
    name1: "Drink Red Stinh",
    describe: "Energy Drink Sting Energy is a carbonated energy drink from PepsiCo International and produced by Rockstar Inc. Sting is available in flavors such as the original Gold Rush, Gold, Power Pacq, Power Lime and Berry …"
  ),
  Popular(
    id: 9,
    name: "Hot Salan",
    img: 'images/salan.png',
    money: 10,
    name1: "Salan",
    describe: "A dish consisting of mixed pieces of food, with some definitions requiring at least one raw ingredient."
  ),
  Popular(
    id: 10,
    name: "Hot Biryani",
    img: 'images/biryani.png',
    money: 10,
    name1: "Biryani",
    describe: "Biryani is a mixed rice dish originating among the Muslims of South Asia. It is made with spices, vegetables, rice, and usually some type of meat. In some cases without any meat, and sometimes with e…"
  ),


];
