class Product{
  final int id;
  final String pathImage;
  final String name;
  final double price;
  int quantity;
  int countitem;
  int total;
  Product({
    required this.id,
    required this.pathImage,
    required this.name,
    required this.price,
    this.quantity = 0,
    this.countitem = 1,
    this.total = 0,
});
}