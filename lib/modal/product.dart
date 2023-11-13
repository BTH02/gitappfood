class Product {
  final int id;
  final String pathImage;
  final String name;
  final int price;
  final int quantity;
  int countItem;
  final String describe;

  Product({
    required this.id,
    required this.pathImage,
    required this.name,
    required this.describe,
    required this.price,
    this.quantity = 0,
    this.countItem = 1,
  });

  factory Product.pure() {
    return Product(
      id: 100,
      pathImage: 'images/pizza.png',
      name: 'Pizzaa',
      price: 10,
      describe: "Pizza Hut is an American multinational restaurant chain and international franchise founded in 1958 in Wichita, Kansas by Dan and Frank Carney. The chain, headquartered in Plano, Texas, operates 17,63…"
    );
  }
}
