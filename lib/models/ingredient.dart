class Ingredient {
  final String id;
  final String name;
  final bool oneOrMore;
  final double price;
  int quantity;

  Ingredient({
    this.id,
    this.name,
    this.oneOrMore,
    this.price,
    this.quantity = 0,
  });

  Ingredient getClone() {
    return Ingredient(
      id: id,
      name: name,
      oneOrMore: oneOrMore,
      price: price,
      quantity: quantity,
    );
  }
}
