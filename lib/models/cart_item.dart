import 'package:ohmyfood_flutter/models/menu.dart';

class CartItem {
  final String id;
  final Menu menu;
  int quantity;

  CartItem({
    this.id,
    this.menu,
    this.quantity = 1,
  });

  double getTotal() {
    return menu.price -
        (menu.price * menu.discountPercent) +
        menu.ingredients
            .map((e) => e.price * e.quantity)
            .toList()
            .reduce((value, element) => value + element);
  }

  CartItem getClone() {
    return CartItem(
      id: id,
      menu: menu.getClone(),
      quantity: quantity,
    );
  }
}
